import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../config/config_export.dart';
import '../../../data/list_top_route_model.dart';

enum PreparationType { favorites, addNew, upcoming }

final currentPreparationType = PreparationType.favorites.obs;

class SheetGrabberTitle extends StatelessWidget {
  const SheetGrabberTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (currentPreparationType.value) {
        case PreparationType.favorites:
          return Text(
            "Top ${tempTopRoute.length} routes",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: AppColors.white100,
              fontWeight: FontWeight.w400,
            ),
          );
        case PreparationType.addNew:
          return TextField(
            decoration: InputDecoration(
              hintText: 'Find your running place',
              hintStyle: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: TextColor.secondaryText,
                fontWeight: FontWeight.w400,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 60,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  "assets/svg/search.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: TextColor.white,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.white,
          );

        case PreparationType.upcoming:
          return Text(
            "Total ${tempTopRoute.sublist(0, 2).length} prepared routes",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: AppColors.white100,
              fontWeight: FontWeight.w400,
            ),
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}
