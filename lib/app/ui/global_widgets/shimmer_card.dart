import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  final bool vertical;

  const ShimmerCard({super.key, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: vertical ? 16 : 0, right: !vertical ? 16 : 0),
      width: vertical ? double.infinity : 120,
      height: vertical ? 150 : 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}
