import 'package:eip_app/features/project_screen.dart';
import 'package:flutter/material.dart';

import '../core/widgets/project_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> projects = [
    {
      'title': 'Site Web E-commerce',
      'desc': 'Refonte complète du site web e-commerce avec nouveau design',
      'date': '15 oct. 2023',
      'status': 'Actif',
    },
    {
      'title': 'Application Mobile',
      'desc': 'Développement d\'une application mobile iOS et Android',
      'date': '5 nov. 2023',
      'status': 'Terminé',
    },
    {
      'title': 'Site Librairie',
      'desc': 'Redesign d\'une librairie',
      'date': '1 jan. 2024',
      'status': 'Actif',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portail Client'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Notifications')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Paramètres')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vos Projets",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Gérez vos projets et accédez à leurs ressources"),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Rechercher un projet...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCard(
                    title: project['title'] ?? 'Projet',
                    description: project['desc'] ?? '',
                    createdDate: project['date'] ?? '',
                    members:
                        const [], // You can update this to real member data
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
