import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff25D366),
        ),
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Total 5 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: TextStyle(
              color: const Color.fromARGB(
                  255, 0, 202, 7)), // Changed title color to green
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search function logic
            },
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Additional options
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // Make TabBar scrollable for more than 3 tabs
          tabs: [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
            Tab(text: 'Community'), // New tab
            Tab(text: 'Settings'), // New tab
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
          CommunityScreen(), // New screen for "Community"
          SettingsScreen(), // New screen for "Settings"
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for Floating Action Button (e.g., New Chat)
        },
        child: Icon(Icons.message),
        backgroundColor: Color(0xff25D366),
      ),
    );
  }
}

// List of contacts
final List<String> contactNames = [
  'agung',
  'ari',
  'bintang',
  'pak giri',
  'bulan sutena',
  'saput',
];

// Function to get random colors for profile avatars
Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

// Function to get random time for each contact
String getRandomTime() {
  Random random = Random();
  int hours = random.nextInt(24);
  int minutes = random.nextInt(60);
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

// Chats Screen
class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: getRandomColor(),
            child: Text(
              contactNames[index][0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(contactNames[index]),
          subtitle: Text('Last message from ${contactNames[index]}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getRandomTime()),
              if (index == 0)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// Other screens
class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Status Screen'));
  }
}

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Calls Screen'));
  }
}

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Community Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Status: Available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to edit profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
