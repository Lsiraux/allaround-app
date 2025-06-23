import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsShimmerList extends StatelessWidget {
  const ProjectsShimmerList({super.key, this.count = 5});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder:
          (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SizedBox(height: 173),
              ),
            ),
          ),
    );
  }
}
