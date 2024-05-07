import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreparedComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.4.sh,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: 140.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.basicActivitiesCard,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distance',
                        style: CustomGoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      Text(
                        '1.2 km',
                        style: CustomGoogleFonts.roboto(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: 140.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.basicActivitiesCard,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elevation',
                        style: CustomGoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      Text(
                        '12 m',
                        style: CustomGoogleFonts.roboto(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút "Complete"
                },
                child: Text(
                  'Complete',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff26322),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 145.0,
                    vertical: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Progress"
                  },
                  icon: const Icon(Icons.timeline, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Preparation"
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Ready"
                  },
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Train"
                  },
                  icon: const Icon(Icons.directions_run, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Challenge"
                  },
                  icon: const Icon(Icons.emoji_events, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
