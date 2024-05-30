import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../../../../../config/config_export.dart';
import 'package:get/get.dart';

class SendingLocation extends StatelessWidget {
  const SendingLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isCheck = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Share your location during run for up to 2 safety contacts.',
          style: CustomGoogleFonts.roboto(
            color: AppColors.white100,
            fontSize: AppFontSizes.size14,
            fontWeight: FontWeight.w400,
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
                fontSize: AppFontSizes.size16,
                color: AppColors.white100,
                fontWeight: FontWeight.w500,
              ),
            ),
            value: isCheck.value,
            onChanged: (value) {
              isCheck.toggle();
            },
          ),
        ),
        const Divider(
          thickness: 0.5,
          height: 32,
        ),
        const SizedBox(
          height: 20,
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
        TextField(
          style: CustomGoogleFonts.roboto(
            color: TextColor.white,
            fontSize: AppFontSizes.size16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: CountryCodePicker(
              onChanged: (code) {},
              textStyle: CustomGoogleFonts.roboto(
                color: AppColors.white100,
                fontSize: AppFontSizes.size16,
                fontWeight: FontWeight.w500,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5),
              initialSelection: 'VN',
              favorite: const ['+84', 'VN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
            hintText: 'Contact 1 number',
            hintStyle: CustomGoogleFonts.roboto(
              color: TextColor.secondaryText,
              fontSize: AppFontSizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          style: CustomGoogleFonts.roboto(
            color: TextColor.white,
            fontSize: AppFontSizes.size16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: CountryCodePicker(
              onChanged: (code) {},
              textStyle: CustomGoogleFonts.roboto(
                color: AppColors.white100,
                fontSize: AppFontSizes.size16,
                fontWeight: FontWeight.w500,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5),
              initialSelection: 'VN',
              favorite: const ['+84', 'VN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
            hintText: 'Contact 2 number',
            hintStyle: CustomGoogleFonts.roboto(
              color: TextColor.secondaryText,
              fontSize: AppFontSizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
