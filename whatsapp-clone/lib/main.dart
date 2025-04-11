import 'package:flutter/material.dart';
import 'screens/chats_screen.dart';
import 'screens/status_screen.dart';
import 'screens/calls_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF017B6B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF017B6B),
          primary: const Color(0xFF017B6B),
          secondary: const Color(0xFF128C7E),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      home: const WhatsAppHome(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ChatsScreen(), StatusScreen(), CallsScreen()],
      ),
    );
  }
}
