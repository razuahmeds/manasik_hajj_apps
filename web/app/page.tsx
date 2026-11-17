const features = [
  ["🕋","Hajj Guide","Step-by-step rituals, checklists and reviewed guidance."],
  ["🌙","Umrah Guide","Ihram, Tawaf, Sa’i and practical preparation."],
  ["📖","Quran & Dua","Verified Arabic text, translations, audio and bookmarks."],
  ["🧭","Qibla & Prayer","Prayer schedule, Qibla direction and reminders."],
  ["🗺️","Smart Map","Makkah, Madinah and key pilgrimage locations."],
  ["🤖","AI Assistant","Multilingual answers with references and safety limits."],
  ["👨‍👩‍👧","Group Companion","Opt-in group coordination and temporary location sharing."],
  ["🆘","Emergency Help","Verified local contacts, SOS and saved emergency details."],
  ["✈️","Travel Organizer","Itinerary, booking records and travel documents checklist."],
];
const languages = ["বাংলা","English","العربية","اردو","Türkçe","Bahasa Indonesia","Bahasa Melayu","Français","हिन्दी","فارسی"];
export default function Home() {
 return <main className="shell">
  <nav className="top"><div className="brand">☾ MANASIK<span>.</span></div><div className="pill">🌐 10 Languages</div><div className="pill">Hajj & Umrah Companion</div></nav>
  <section className="hero"><div><div className="gold">YOUR SPIRITUAL JOURNEY, SUPPORTED</div><h1>Plan. Perform.<br/><span className="gold">Pray. Return.</span></h1><p>A trusted digital companion for Hajj and Umrah — bringing guides, duas, maps, prayer tools and group support together in one place.</p><a className="cta" href="#features">Explore MANASIK →</a></div><div className="hero-art">🕋</div></section>
  <section className="section"><h2>Designed for pilgrims worldwide</h2><div className="steps">{languages.map(x=><div className="step" key={x}>🌐 <b>{x}</b></div>)}</div></section>
  <section className="section" id="features"><h2>Everything you need, in one companion</h2><div className="grid">{features.map(([icon,title,desc])=><article className="card" key={title}><div className="icon">{icon}</div><h3>{title}</h3><p>{desc}</p></article>)}</div></section>
  <section className="section"><h2>Built with care and trust</h2><div className="grid"><article className="card"><h3>📚 Reviewed guidance</h3><p>Ritual content should be reviewed by qualified scholars and show its sources.</p></article><article className="card"><h3>🔒 Privacy first</h3><p>Location sharing is opt-in, revocable and limited to the time needed.</p></article><article className="card"><h3>📶 Offline ready</h3><p>Core guides and saved checklists are designed to remain available offline.</p></article></div></section>
  <footer>© {new Date().getFullYear()} MANASIK. Independent travel companion concept; not an official government or Nusuk service.</footer>
 </main>;
}
