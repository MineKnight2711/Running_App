import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/trail_model.dart';
import 'package:flutter_running_demo/screens/progress/activities_details/components/search_sheet/sheet_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../trail_details/components/trail_details_map.dart';

class ShareSheet extends StatelessWidget {
  final TrailModel trail;
  const ShareSheet({super.key, required this.trail});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7, //Kích cỡ sheet khi vừa hiện lên
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
                spaceBetween: 180,
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
                child: TrailDetailsMapWidget(
                  haveRPE: false,
                  titleInFooter: true,
                  trail: trail,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
