import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/screens/progress/activities_details/components/search_sheet/sheet_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/route_model/route_model.dart';
import '../trail_details/components/trail_details_map.dart';

class ShareSheet extends StatelessWidget {
  final RouteModel route;
  const ShareSheet({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75, //Kích cỡ sheet khi vừa hiện lên
      minChildSize: 0.3, //Khi ta kéo sheet về 0.3 chiều cao của nó, nó sẽ đóng
      maxChildSize: 0.95, //Chiều cao tối đa của sheet được phép kéo lên
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
          child: Column(
            children: [
              SheetRow(
                rowTitle: "Share option",
                spaceBetween: 140.w,
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Divider(
                thickness: 0.5.r,
                height: 16.h,
              ),
              Container(
                width: 1.sw,
                height: 0.3.sh,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                                "assets/images/activities_details/map.png")
                            .image,
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
                child: RouteDetailsMapWidget(
                  haveRPE: false,
                  titleInFooter: true,
                  route: route,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              ShareOption(
                image: "location_map",
                option: "Publish on running map",
                onTap: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              ShareOption(
                image: "g_logo_white",
                option: "Share to genki community",
                onTap: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              ShareOption(
                image: "more_option",
                option: "More option",
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShareOption extends StatelessWidget {
  final String image, option;
  final VoidCallback onTap;
  const ShareOption({
    super.key,
    required this.image,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color(0xFFFFFFFF).withOpacity(0.2)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/activities_details/$image.png",
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              option,
              style: CustomGoogleFonts.roboto(
                  fontSize: 16.r, color: AppColors.white100),
            )
          ],
        ),
      ),
    );
  }
}
