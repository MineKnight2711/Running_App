import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendingLocation extends StatelessWidget {
  const SendingLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isCheck = false.obs;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.85.sh,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sending location for safety',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r, color: Colors.white),
                ),
                const Icon(CupertinoIcons.xmark, color: Colors.white),
              ],
            ),
            Divider(
              thickness: 0.5.r,
              height: 32,
            ),
            Text(
              'Share your location during run for up to 2 safety contacts.',
              style: CustomGoogleFonts.roboto(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.appButton,
                checkColor: Colors.white,
                title: Text(
                  'Agree to share',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16, color: Colors.white),
                ),
                value: isCheck.value,
                onChanged: (value) {
                  isCheck.toggle();
                },
              ),
            ),
            Divider(
              thickness: 0.5.r,
              height: 32,
            ),
            Text(
              'Add safety contacts:',
              style: CustomGoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.red),
                const SizedBox(width: 20),
                Text(
                  '+84 | Contact 1 number',
                  style: CustomGoogleFonts.roboto(
                      color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Divider(
              thickness: 0.5.r,
              height: 32,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.red),
                const SizedBox(width: 20),
                Text(
                  '+84 | Contact 2 number',
                  style: CustomGoogleFonts.roboto(
                      color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Divider(
              thickness: 0.5.r,
              height: 32,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút "Complete"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appButton,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 160.0,
                    vertical: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Done',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 280,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Progress"
                  },
                  icon: const Icon(Icons.timeline),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Preparation"
                  },
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Ready"
                  },
                  icon: const Icon(Icons.check_circle),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Train"
                  },
                  icon: const Icon(Icons.directions_run),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Challenge"
                  },
                  icon: const Icon(Icons.emoji_events),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
