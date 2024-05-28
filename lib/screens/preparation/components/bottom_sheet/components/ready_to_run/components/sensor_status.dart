import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SensorStatus extends StatelessWidget {
  const SensorStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Devices',
              style: CustomGoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              'Status',
              style: CustomGoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Icon(
              Icons.watch,
              size: 32,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Text(
              'Garmin watch',
              style:
                  CustomGoogleFonts.roboto(fontSize: 20, color: Colors.white),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút info
              },
            ),
          ],
        ),
        Divider(
          thickness: 0.5.r,
          height: 32,
        ),
        const SizedBox(height: 16),
        Text(
          'If there is no available pulse rate sensor, let:',
          style: CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          '1. Connect your device to your phone using bluetooth.',
          style: CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: 'Go to',
              style: CustomGoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.white100,
              ),
            ),
            TextSpan(
              text: ' EWS settings >  ',
              style: CustomGoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.appButton,
              ),
            ),
            TextSpan(
              text: "to enable it through Genki app",
              style: CustomGoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.white100,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
