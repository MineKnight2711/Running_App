import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadyToRun extends StatelessWidget {
  const ReadyToRun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          height: 0.2.sh,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.shopping_cart, color: Colors.white),
                  SizedBox(width: 16),
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 16),
                  Icon(Icons.attach_money, color: Colors.white),
                  SizedBox(width: 16),
                  Icon(Icons.music_note, color: Colors.white),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print('da nhan');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.appButton,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Go',
                        style: CustomGoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
