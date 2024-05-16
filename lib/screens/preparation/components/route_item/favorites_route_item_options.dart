import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/widgets/alert_dialogs/confirm_alert_dialogs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../models/route_model/route_model.dart';

class RouteItemOption extends StatelessWidget {
  final RouteModel route;
  const RouteItemOption({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.basicActivitiesCard,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmAlertDialogs(
                  title: "Confirm addition",
                  content: Text(
                    "Do you want to add this route to your upcoming running list?",
                    textAlign: TextAlign.center,
                    // softWrap: false,

                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  iconSvgPath: "check",
                  confirmButtonText: "Yes, add",
                  confirmButtonColorGradient:
                      AppColors.comfirmButtonDefaultGradient,
                ),
              );
            },
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/check.svg"),
          ),
          InkWell(
            onTap: () {
              AppRoutes.navigateToDetails(AppRoutes.detailRoute, route);
            },
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/info.svg"),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/share.svg"),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmAlertDialogs(
                  title: "Rename '${route.title}'",
                  content: TextField(
                    style: CustomGoogleFonts.roboto(
                      color: AppColors.white100,
                      fontSize: 16.r,
                    ),
                    decoration: InputDecoration(
                      hintText: "New name of route",
                      hintStyle: CustomGoogleFonts.roboto(
                          fontSize: 16.r, color: TextColor.placeholder),
                    ),
                  ),
                  iconSvgPath: "edit",
                  confirmButtonText: "Yes, add",
                  confirmButtonColorGradient:
                      AppColors.comfirmButtonDefaultGradient,
                ),
              );
            },
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/edit.svg"),
          ),
          InkWell(
            radius: 20,
            splashColor: Colors.redAccent,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmAlertDialogs(
                  title: "Confirm deletion",
                  content: Text(
                    "Are you sure you want to delete this route in your favorite list?",
                    textAlign: TextAlign.center,
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  iconSvgPath: "delete",
                  confirmButtonText: "Yes, delete",
                  confirmButtonColor: AppColors.confirmAlertDialogDeleteButton,
                ),
              );
            },
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/delete.svg"),
          ),
        ],
      ),
    );
  }
}
