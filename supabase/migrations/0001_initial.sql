-- MANASIK initial schema. Review policies and data retention before production.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  preferred_language text not null default 'en',
  created_at timestamptz not null default now()
);

create table if not exists public.content_categories (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  sort_order int not null default 0
);

create table if not exists public.guides (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  category text not null check (category in ('hajj','umrah')),
  step_number int not null default 0,
  status text not null default 'draft' check (status in ('draft','review','published')),
  source_references jsonb not null default '[]'::jsonb,
  scholar_reviewed boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists public.guide_translations (
  id uuid primary key default gen_random_uuid(),
  guide_id uuid not null references public.guides(id) on delete cascade,
  language_code text not null,
  title text not null,
  body text not null,
  unique (guide_id, language_code)
);

create table if not exists public.duas (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  arabic_text text not null,
  source_reference text,
  audio_url text,
  verified boolean not null default false
);

create table if not exists public.dua_translations (
  id uuid primary key default gen_random_uuid(),
  dua_id uuid not null references public.duas(id) on delete cascade,
  language_code text not null,
  transliteration text,
  translation text not null,
  unique (dua_id, language_code)
);

create table if not exists public.pilgrimage_groups (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id),
  name text not null,
  invite_code text unique,
  created_at timestamptz not null default now()
);

create table if not exists public.group_members (
  group_id uuid not null references public.pilgrimage_groups(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  role text not null default 'member' check (role in ('owner','leader','member')),
  joined_at timestamptz not null default now(),
  primary key (group_id,user_id)
);

-- Store only short-lived, consented location shares. Add scheduled deletion.
create table if not exists public.location_shares (
  id uuid primary key default gen_random_uuid(),
  group_id uuid not null references public.pilgrimage_groups(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  latitude double precision not null check (latitude between -90 and 90),
  longitude double precision not null check (longitude between -180 and 180),
  expires_at timestamptz not null,
  created_at timestamptz not null default now()
);

create table if not exists public.emergency_contacts (
  id uuid primary key default gen_random_uuid(),
  country_code text not null,
  region text,
  service_name text not null,
  phone_number text not null,
  source_url text,
  verified_at date,
  active boolean not null default false
);

create table if not exists public.bookings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id),
  provider_name text not null,
  provider_reference text,
  booking_type text not null,
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

create table if not exists public.audit_logs (
  id uuid primary key default gen_random_uuid(),
  actor_id uuid references auth.users(id),
  action text not null,
  entity_type text not null,
  entity_id text,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.guides enable row level security;
alter table public.guide_translations enable row level security;
alter table public.duas enable row level security;
alter table public.dua_translations enable row level security;
alter table public.pilgrimage_groups enable row level security;
alter table public.group_members enable row level security;
alter table public.location_shares enable row level security;
alter table public.bookings enable row level security;

create policy "profile owner read" on public.profiles for select using (auth.uid() = id);
create policy "profile owner update" on public.profiles for update using (auth.uid() = id);
create policy "published guides read" on public.guides for select using (status = 'published');
create policy "guide translations read" on public.guide_translations for select using (
  exists (select 1 from public.guides g where g.id = guide_id and g.status = 'published')
);
create policy "verified duas read" on public.duas for select using (verified = true);
create policy "dua translations read" on public.dua_translations for select using (
  exists (select 1 from public.duas d where d.id = dua_id and d.verified = true)
);
create policy "group members read own groups" on public.group_members for select using (auth.uid() = user_id);
create policy "group owner read" on public.pilgrimage_groups for select using (
  owner_id = auth.uid() or exists (
    select 1 from public.group_members gm where gm.group_id = id and gm.user_id = auth.uid()
  )
);
create policy "location owner read" on public.location_shares for select using (auth.uid() = user_id);
create policy "booking owner read" on public.bookings for select using (auth.uid() = user_id);

-- Admin writes should be implemented via trusted server-side role checks,
-- not by exposing the Supabase service-role key to a browser or mobile client.
