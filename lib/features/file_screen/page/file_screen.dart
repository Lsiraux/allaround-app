import 'dart:math';

import 'package:eip_app/constants/fake_data/file_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/models/file_card.dart';
import '../widgets/storage_bar.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int storageTotal = 500;
    final double storageUsed = Random().nextDouble() * storageTotal;
    final List<FileCardData> fakeFiles = sampleFiles;

    return Scaffold(
      backgroundColor: const Color(0xFFf0f2f5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StorageBar(used: storageUsed, total: storageTotal),
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
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) {
                  final file = fakeFiles[index];
                  return _fileCard(
                    fileName: file.fileName,
                    size: file.size,
                    description: file.description,
                    uploadedBy: file.uploadedBy,
                    date: DateFormat('d MMM, HH:mm').format(file.uploadDate),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchAndControls() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher par nom, description...',
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
          label: const Text('Téléverser'),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.image, size: 30, color: Colors.grey),
              const Chip(
                label: Text('Image'),
                backgroundColor: Color(0xFFE9F1FF),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Prévisualisable',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            fileName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(size, style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
    );
  }
}
