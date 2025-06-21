import 'package:eip_app/constants/fake_data/file_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/models/file_card.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storageUsed = 88.8;
    final storageTotal = 500.0;
    final List<FileCardData> fakeFiles = sampleFiles;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fichiers'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _storageBar(used: storageUsed, total: storageTotal),
            const SizedBox(height: 16),
            _searchAndControls(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 220,
                ),
                itemCount: fakeFiles.length,
                itemBuilder: (context, index) {
                  final file = fakeFiles[index];
                  return _fileCard(
                    fileName: file.fileName,
                    size: file.size,
                    description: file.description,
                    uploadedBy: file.uploadedBy,
                    date: DateFormat('d MMM, HH:mm').format(file.uploadDate),
                    // add any other fields you expose in _fileCard, e.g.:
                    // typeLabel: file.typeLabel,
                    // isPreviewable: file.isPreviewable,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storageBar({required double used, required double total}) {
    final percentage = (used / total * 100).toStringAsFixed(1);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F6FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud, size: 30, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Stockage du projet",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text("$used KB utilisés sur $total MB"),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: used / total,
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "$percentage%\nutilisé",
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _searchAndControls() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Rechercher par nom, description...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _fileCard({
    required String fileName,
    required String size,
    required String description,
    required String uploadedBy,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.image, size: 30, color: Colors.grey),
                Chip(label: Text("Image"), backgroundColor: Color(0xFFE9F1FF)),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Prévisualisable",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              fileName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              size,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.person, size: 14),
                const SizedBox(width: 4),
                Text(uploadedBy, style: const TextStyle(fontSize: 12)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 14),
                const SizedBox(width: 4),
                Text(date, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
