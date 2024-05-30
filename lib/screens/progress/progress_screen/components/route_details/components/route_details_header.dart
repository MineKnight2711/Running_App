import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/datetime_extension.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:flutter_running_demo/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../config/config_export.dart';
import '../../../../../../models/route_model/route_model.dart';
import '../../share_sheet/share_sheet.dart';

class RouteDetailsHeader extends StatelessWidget {
  final RouteModel route;

  const RouteDetailsHeader({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacings.cvs(52),
      color: AppColors.basicActivitiesCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: AppSpacings.chs(35),
            height: AppSpacings.chs(35),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0x0DFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset("assets/svg/walk.svg"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: AppSpacings.sw(0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      route.title,
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size16,
                          color: AppColors.white100),
                    ),
                    SizedBox(
                      width: AppSpacings.chs(5),
                    ),
                    SvgPicture.asset("assets/svg/people.svg"),
                    const Spacer(),
                    route.haveInfo
                        ? SvgPicture.asset("assets/svg/info.svg")
                        : const SizedBox.shrink(),
                    SizedBox(
                      width: AppSpacings.chs(10),
                    ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context:
                                NavigatorKeys.mainNavigatorKey.currentContext!,
                            isScrollControlled: true,
                            builder: (context) {
                              return CustomBottomSheet(
                                sheetHeight: 0.85,
                                sheetTitle: "Share Option",
                                sheetBody: ShareSheet(
                                  route: route,
                                ),
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset("assets/svg/share.svg"))
                  ],
                ),
              ),
              SizedBox(
                width: AppSpacings.sw(0.8),
                child: Row(
                  children: [
                    Text(
                      route.date.dateTimeFormat(),
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB)),
                    ),
                    Flexible(
                      child: Text(
                        ' | ${route.place}',
                        overflow: TextOverflow.ellipsis,
                        style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
