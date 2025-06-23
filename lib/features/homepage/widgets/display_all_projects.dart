import 'package:eip_app/features/homepage/widgets/project_card.dart';
import 'package:flutter/material.dart';

import '../../bottom_navigation/page/project_screen.dart';
import 'no_project_found.dart';

class DisplayAllProjects extends StatefulWidget {
  const DisplayAllProjects({super.key, required this.projects});

  final List<Map<String, String>> projects;

  @override
  State<DisplayAllProjects> createState() => _DisplayAllProjectsState();
}

class _DisplayAllProjectsState extends State<DisplayAllProjects> {
  late List<bool> isPinnedList;

  @override
  void initState() {
    super.initState();
    isPinnedList = List<bool>.filled(widget.projects.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return widget.projects.isEmpty
        ? const NoProjectsFound()
        : ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: widget.projects.length,
          itemBuilder: (context, index) {
            final project = widget.projects[index];
            return ProjectCard(
              onDelete: () {
                print("c'est delete");
              },
              onEdit: () {
                print("c'est edit");
              },
              isPinned: isPinnedList[index],
              onPinToggle: () {
                setState(() {
                  isPinnedList[index] = !isPinnedList[index];
                });
              },
              title: project['title'] ?? 'Projet',
              description: project['desc'] ?? '',
              createdDate: project['date'] ?? '',
              members: const ["L"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => NavigationFooter(
                          projectName: project['title'] ?? 'Projet',
                        ),
                  ),
                );
              },
            );
          },
        );
  }
}
