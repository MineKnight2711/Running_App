import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import '../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';

class RouteSaveToFavoriteBottomSheet extends StatelessWidget {
  const RouteSaveToFavoriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: CustomDraggableSheetWidget(
        showGrabber: false,
        inititalSize: 0.3,
        maxSize: 0.3,
        grabberBottom: SaveToFavoriteBottomSheetGrabberBottom(),
      ),
    );
  }
}

class SaveToFavoriteBottomSheetGrabberBottom extends StatelessWidget {
  const SaveToFavoriteBottomSheetGrabberBottom({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isPublic = false.obs;
    RxBool isAddToUpcoming = false.obs;

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.appTheme),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: AppSpacings.heightByScreenHeight(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Name Your Route',
            style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16, color: Colors.white),
          ),
          const Divider(
            thickness: 0.5,
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
                    fontSize: AppFontSizes.size14, color: Colors.white),
              ),
              Text(
                'Elevation: 12 m',
                style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size14, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 0.5,
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
          const Divider(
            thickness: 0.5,
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
                style:
                    CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
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
                icon:
                    const Icon(Icons.signal_cellular_alt, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
