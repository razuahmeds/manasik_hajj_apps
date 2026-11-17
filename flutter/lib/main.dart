import 'package:material_ui/material_ui.dart';

void main() => runApp(const ManasikApp());

class ManasikApp extends StatelessWidget {
  const ManasikApp({super.key});
  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF123D32);
    return MaterialApp(
      title: 'MANASIK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF8F6EF),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const items = [
    ('🕋', 'Hajj Guide'), ('🌙', 'Umrah Guide'),
    ('📖', 'Quran & Dua'), ('🗺️', 'Smart Map'),
    ('🧭', 'Qibla'), ('🤖', 'AI Assistant'),
    ('👨‍👩‍👧', 'My Group'), ('🆘', 'Emergency'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MANASIK', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF123D32),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Assalamu Alaikum', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text('Your spiritual journey starts here.',
                style: TextStyle(color: Color(0xFFF1D18B), fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Guides, duas, maps and travel tools in one place.',
                style: TextStyle(color: Colors.white)),
            ]),
          ),
          const SizedBox(height: 22),
          const Text('Explore MANASIK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) => Card(
              child: Center(child: Text('${items[index].$1}  ${items[index].$2}',
                style: const TextStyle(fontWeight: FontWeight.w600))),
            ),
          ),
          const SizedBox(height: 14),
          const Text('Prototype only — connect verified content, authentication and APIs before release.',
            style: TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Guide'),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.smart_toy_outlined), label: 'AI'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
