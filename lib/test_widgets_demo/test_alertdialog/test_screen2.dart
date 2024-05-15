import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TestPreparationScreen extends StatelessWidget {
  const TestPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isPublic = false.obs;
    RxBool isAddToUpcoming = false.obs;

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(gradient: AppColors.appTheme),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: 0.5.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name Your Route',
                style: CustomGoogleFonts.roboto(
                    fontSize: 16.r, color: Colors.white),
              ),
              Divider(
                thickness: 0.5.r,
                height: 22,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance: 1.2 km',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 14.r, color: Colors.white),
                  ),
                  Text(
                    'Elevation: 12 m',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 14.r, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 0.5.r,
                height: 22,
              ),
              Row(
                children: [
                  Text(
                    'Open to public',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Checkbox(
                      activeColor: AppColors.appButton,
                      checkColor: Colors.white,
                      value: isPublic.value,
                      onChanged: (value) {
                        isPublic.value = value!;
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5.r,
                height: 22,
              ),
              Row(
                children: [
                  Text(
                    'Add to upcoming run list',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Checkbox(
                      activeColor: AppColors.appButton,
                      checkColor: Colors.white,
                      value: isAddToUpcoming.value,
                      onChanged: (value) {
                        isAddToUpcoming.value = value!;
                      },
                    ),
                  ),
                ],
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
                      horizontal: 120.0,
                      vertical: 14.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save to favorites',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timeline, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.directions_run, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sports, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.signal_cellular_alt,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
