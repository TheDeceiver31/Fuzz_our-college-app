import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzz/SearchPage.dart';

import 'FeedPage.dart';

void main() => runApp(const SmartCampusApp());

class SmartCampusApp extends StatelessWidget {
  const SmartCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FUZZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/app_icon.png'), // Splash image
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FeedPage(),
    SearchPage(),
    ProjectsPage(), // Corrected here, it should be the widget reference
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Smart Campus'),
          centerTitle: true,
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.9,
              backgroundColor: Colors.green,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month, color: Colors.black),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book, color: Colors.black),
                  label: 'Projects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  label: 'Updates',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.black),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ));
  }
}

// Sample Search Page
// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Search Page',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
// Sample Add Post Page (Renamed from 'projects' to 'ProjectsPage')

// Define a Project class to store individual project details

class ProjectsPage extends StatelessWidget {
  // Define a list of projects with unique details
  final List<Project> projects = [
    Project(
      id: '1',
      title: 'Project Alpha',
      description: 'Description for Project Alpha...',
      status: 'In Progress',
      avatarUrl1:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
      avatarUrl2:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
    ),
    Project(
      id: '2',
      title: 'Project Beta',
      description: 'Description for Project Beta...',
      status: 'Completed',
      avatarUrl1:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
      avatarUrl2:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
    ),
    Project(
      id: '3',
      title: 'Project Beta',
      description: 'Description for Project Beta...',
      status: 'Completed',
      avatarUrl1:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
      avatarUrl2:
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
    ),
    // Add more projects with unique details here
  ];

  ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects Overview'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Review the details below of all the projects in our college',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length, // Use the length of the projects list
            itemBuilder: (context, index) {
              final project = projects[index];
              return Column(
                children: [
                  ProjectCard(
                    id: project.id,
                    title: project.title,
                    description: project.description,
                    status: project.status,
                    avatarUrl1: project.avatarUrl1,
                    avatarUrl2: project.avatarUrl2,
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class Project {
  final String id;
  final String title;
  final String description;
  final String status;
  final String avatarUrl1;
  final String avatarUrl2;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.avatarUrl1,
    required this.avatarUrl2,
  });
}

// Reusable ProjectCard widget to display individual project details
class ProjectCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String status;
  final String avatarUrl1;
  final String avatarUrl2;

  const ProjectCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.avatarUrl1,
    required this.avatarUrl2,
  });

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;

    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(
              isExpanded
                  ? description
                  : description.length > 100
                      ? description.substring(0, 100) + '...'
                      : description,
              style: const TextStyle(fontSize: 14.0),
            ),
            if (description.length > 100)
              TextButton(
                onPressed: () {
                  isExpanded = !isExpanded;
                  (context as Element).markNeedsBuild();
                },
                child: Text(isExpanded ? 'Show Less' : 'Read More'),
              ),
            const SizedBox(height: 8.0),
            Text('Status: $status',
                style: const TextStyle(
                    fontSize: 14.0, fontStyle: FontStyle.italic)),
            const SizedBox(height: 8.0),
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(avatarUrl1)),
                const SizedBox(width: 8.0),
                CircleAvatar(backgroundImage: NetworkImage(avatarUrl2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Notifications Page
class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  // Sample chat data
  final List<Map<String, String>> chats = [
    {'name': 'Babita', 'lastMessage': 'Hey, how are you?'},
    {'name': 'Jethalal', 'lastMessage': 'Let\'s catch up tomorrow!'},
    {'name': 'Iyer', 'lastMessage': 'Are you coming to the event?'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Updates')),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(child: Text(chat['name']![0])),
            title: Text(chat['name']!),
            subtitle: Text(chat['lastMessage']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationScreen(name: chat['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ConversationScreen extends StatefulWidget {
  final String name;
  const ConversationScreen({super.key, required this.name});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final List<String> messages = ['Hello!', 'How are you?'];
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.grey[300] : Colors.blue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(messages[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      messages.insert(0, messageController.text);
                      messageController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Sample Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
