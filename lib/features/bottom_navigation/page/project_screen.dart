import 'package:eip_app/features/chat_screen/page/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../file_screen/page/file_screen.dart';

class NavigationFooter extends StatefulWidget {
  const NavigationFooter({super.key, required this.projectName});
  final String projectName;

  @override
  NavigationFooterState createState() => NavigationFooterState();
}

class NavigationFooterState extends State<NavigationFooter> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    HapticFeedback.mediumImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f2f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(widget.projectName),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Notifications')));
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const FileManagerScreen(),
          ChatScreen(projectName: widget.projectName),
          const Center(child: Text('Timeline')),
          const Center(child: Text('Paramètres')),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF40B3A2),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Fichiers',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),

            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'Timeline',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
          ],
        ),
      ),
    );
  }
}
