import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String createdDate;
  final List<String> members;
  final VoidCallback onTap;
  final bool isPinned;
  final VoidCallback onPinToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.members,
    required this.onTap,
    required this.isPinned,
    required this.onPinToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isPinned ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: onPinToggle,
                  ),

                  PullDownButton(
                    buttonBuilder: (context, showMenu) {
                      return IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: showMenu,
                      );
                    },
                    itemBuilder:
                        (context) => [
                          PullDownMenuItem(
                            title: 'Modifier',
                            icon: CupertinoIcons.pencil,
                            onTap: onEdit,
                          ),
                          PullDownMenuItem(
                            title: isPinned ? 'Désépingler' : 'Épingler',
                            icon:
                                isPinned
                                    ? CupertinoIcons.star_fill
                                    : CupertinoIcons.star,
                            onTap: onPinToggle,
                          ),
                          PullDownMenuItem(
                            title: 'Supprimer',
                            icon: CupertinoIcons.delete,
                            isDestructive: true,
                            onTap: onDelete,
                          ),
                        ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(description, style: TextStyle(color: Colors.grey[700])),

              const SizedBox(height: 16),

              // Created date
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Créé le $createdDate",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Members
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.group_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text("Membres:", style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(width: 8),
                  ...members.map(
                    (initials) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        boxShadow: [
                          const BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Text(
                        initials,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
