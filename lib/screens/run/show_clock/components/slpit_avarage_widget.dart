import 'package:flutter/material.dart';

import '../../../../config/spacings.dart';

class SplitAvaragePaceWidget extends StatelessWidget {
  const SplitAvaragePaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacings.vs30 * 1.75,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, color: Colors.green, size: 16),
          SizedBox(width: 4),
          Icon(Icons.circle, color: Colors.green, size: 16),
          SizedBox(width: 4),
          Icon(Icons.circle, color: Colors.green, size: 16),
          SizedBox(width: 4),
          Icon(Icons.circle, color: Colors.green, size: 16),
          SizedBox(width: 4),
          Icon(Icons.circle, color: Colors.green, size: 16),
        ],
      ),
    );
  }
}
