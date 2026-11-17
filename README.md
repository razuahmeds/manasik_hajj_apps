# MANASIK — Hajj & Umrah Super App (Starter)

This is a development starter, not a production-ready Hajj service. It contains:
- Responsive Next.js web prototype (also a starting point for the public website and admin UI)
- Supabase PostgreSQL schema with Row Level Security examples
- Flutter mobile starter screen for Android/iOS
- 10-language starter translation files
- Environment variable template and implementation checklist

## Architecture
- Web: Next.js App Router + TypeScript
- Mobile: Flutter
- Backend: Supabase (PostgreSQL, Auth, Storage, Realtime)
- AI: server-side API integration only; never expose API keys in the client
- Maps: Google Maps / Mapbox integration after provider and Saudi coverage review

## Run the web prototype
1. Install Node.js 20+
2. `cd web`
3. `npm install`
4. Copy `.env.example` to `.env.local` and add Supabase values (optional for visual demo)
5. `npm run dev`
6. Open http://localhost:3000

## Flutter starter
Install Flutter, then from `flutter/` run:
`flutter create .`
`flutter run`

## Supabase
Create a Supabase project and run `supabase/migrations/0001_initial.sql` in the SQL editor.
Review and extend every RLS policy before production. Do not store passport/visa scans until a privacy, retention, encryption, and access-control policy is approved.

## Important product safeguards
- Hajj rulings and ritual content must be reviewed by qualified scholars and clearly cite sources.
- AI answers must not present themselves as fatwas. Escalate uncertain or school-specific questions to qualified scholars.
- Emergency numbers and services must be location-specific, verified, dated, and available offline where appropriate.
- Location sharing must be opt-in, time-limited, revocable, and visible to group members.
- Do not imply official Nusuk, Saudi government, airline, hotel, or visa integration without written authorization and tested APIs.
- Prayer times and Qibla require accurate location permission and a documented calculation method.
- Translation of Quran and dua must use licensed/approved source texts and human review.

## Next implementation milestones
1. Finalize brand, user flows, accessibility and RTL behavior.
2. Add Supabase Auth, profiles, content CMS and audit logs.
3. Add verified guide/dua content and offline cache.
4. Add map, prayer times and Qibla with tested providers.
5. Add opt-in group sharing and emergency workflows.
6. Add AI through a secured server endpoint with citations and guardrails.
7. Add booking only through authorized providers and payment compliance.
8. Security review, privacy policy, terms, app store review and field testing.
