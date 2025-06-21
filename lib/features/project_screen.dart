/*
import 'package:eip_app/features/chat_screen.dart';
import 'package:eip_app/features/file_screen.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final String projectTitle;

  const ProjectScreen({required this.projectTitle});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController = index;
    });
  }

  void _onInvitePressed() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Inviter un membre'),
            content: TextField(
              decoration: InputDecoration(labelText: 'Adresse email'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Annuler'),
              ),
              TextButton(onPressed: () {}, child: Text('Inviter')),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: _onInvitePressed,
            tooltip: 'Inviter',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatScreen(),
          FileManagerScreen(),
          Center(child: Text('Timeline du projet')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Fichiers'),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Timeline',
          ),
        ],
      ),
    );
  }
}
*/
import 'package:eip_app/features/chat_screen.dart';
import 'package:eip_app/features/file_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ChatScreen(projectName: widget.projectName),
          const FileManagerScreen(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Fichiers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'Timeline',
            ),
          ],
        ),
      ),
    );
  }
}
