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
      sheetHeight: 0.43,
      sheetBody: SaveToFavoriteBottomSheetBody(
        mapController: mapController,
      ),
    );
  }
}

class SaveToFavoriteBottomSheetBody extends StatelessWidget {
  final MapController mapController;
  const SaveToFavoriteBottomSheetBody({super.key, required this.mapController});
  @override
  Widget build(BuildContext context) {
    final RxBool isPublic = false.obs;
    final RxBool isAddToUpcoming = false.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 5,
        ),
        TextField(
          onTap: () {},
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.5,
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Open to public',
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
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
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Add to upcoming run list',
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
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
          height: 5,
        ),
        SizedBox(
          height: AppSpacings.cvs(35),
          width: AppSpacings.sw(1),
          child: ElevatedButton(
            onPressed: () {
              // Xử lý khi nhấn nút "Complete"
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Save to favorites',
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
