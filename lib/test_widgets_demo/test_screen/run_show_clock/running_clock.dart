import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RunningClock extends StatelessWidget {
  const RunningClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Time',
              style:
                  CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              '00:04:15',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avg. pace',
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '5.27',
                      style: CustomGoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '/km',
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Split avg. pace',
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Row(
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
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '800',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'm',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pulse rate',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '126',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'BPM',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 360),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.music_note, size: 32, color: Colors.white),
                const SizedBox(width: 32),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Stop
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffff4747),
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 32),
                const Icon(Icons.lock_open, size: 32, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
