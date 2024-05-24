import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/config_export.dart';
import '../../../../../controllers/preparation_map_controller.dart';
import '../../../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';

class RouteSaveToFavoriteBottomSheet extends StatelessWidget {
  final MapController mapController;
  const RouteSaveToFavoriteBottomSheet(
      {super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return CustomDraggableSheetWidget(
      showGrabber: false,
      inititalSize: 0.43,
      maxSize: 0.43,
      minSize: 0.43,
      grabberBottom: SaveToFavoriteBottomSheetBody(
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
    final FocusNode focusNode = FocusNode();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusNode,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AboveKeyBoardBottomSheet(
                      isPublic: isPublic,
                      isAddToUpcoming: isAddToUpcoming)).whenComplete(() {
                focusNode.unfocus();
              });
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
        ],
      ),
    );
  }
}

class AboveKeyBoardBottomSheet extends StatelessWidget {
  const AboveKeyBoardBottomSheet({
    super.key,
    required this.isPublic,
    required this.isAddToUpcoming,
  });

  final RxBool isPublic;
  final RxBool isAddToUpcoming;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.sheetBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
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
            autofocus: true,
          ),
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
