import 'package:flutter/material.dart';

import 'package:flutter_running_demo/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../../../config/config_export.dart';
import '../../../../../controllers/map_controller.dart';

class RouteSaveToFavoriteBottomSheet extends StatelessWidget {
  final MapController mapController;
  const RouteSaveToFavoriteBottomSheet(
      {super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      showSheetTitle: false,
      sheetHeight: 0.45,
      sheetBody: SaveToFavoriteBottomSheetBody(
        mapController: mapController,
      ),
    );
  }
}

class SaveToFavoriteBottomSheetBody extends StatelessWidget {
  final MapController mapController;
  SaveToFavoriteBottomSheetBody({super.key, required this.mapController});
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final RxBool isPublic = false.obs;
    final RxBool isAddToUpcoming = false.obs;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusNode,
            onTap: () {
              FocusScope.of(context).requestFocus(focusNode);
            },
            style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16, color: Colors.white),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Name your route',
                hintStyle: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size16,
                  color: TextColor.placeholder,
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Distance: ',
                      style: CustomGoogleFonts.roboto(
                        fontSize: AppFontSizes.size14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '1.2 km',
                      style: CustomGoogleFonts.roboto(
                        fontSize: AppFontSizes.size18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Elevation: ',
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '12 m',
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]))
            ],
          ),
          const Divider(
            thickness: 0.5,
            height: 20,
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
            height: 20,
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
                  horizontal: 85,
                  vertical: 10,
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
          SizedBox(
            height: AppSpacings.hs25,
          ),
        ],
      ),
    );
  }
}
