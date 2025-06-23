import 'package:flutter/material.dart';

class StorageBar extends StatelessWidget {
  const StorageBar({super.key, required this.used, required this.total});
  final double used;
  final int total;

  @override
  Widget build(BuildContext context) {
    final String sPercentage = (used / total * 100).toStringAsFixed(1);
    final double dPercentage = (used / total);
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
                  'Stockage du projet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text('${used.toStringAsFixed(1)} Mo utilisés sur $total Mo'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: dPercentage,
                  color: dPercentage < 0.80 ? Colors.blue : Colors.red,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$sPercentage% utilisés',
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
