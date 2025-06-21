import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String createdDate;
  final List<String> members;
  final VoidCallback onTap;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.createdDate,
    required this.members,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: title and icons
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Icon(Icons.push_pin_outlined, color: Colors.amber),
                  const SizedBox(width: 8),
                  const Icon(Icons.more_vert),
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

              // Members section
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
                          BoxShadow(color: Colors.black12, blurRadius: 4),
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
