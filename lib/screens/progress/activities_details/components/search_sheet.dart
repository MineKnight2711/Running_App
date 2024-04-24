import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/screens/progress/activities_details/components/search_sheet/search_by.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/date_time_picker.dart';
import 'search_sheet/activites_drow_down.dart';
import 'search_sheet/search_sheet_header.dart';

class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5, //Kích cỡ sheet khi vừa hiện lên
      minChildSize: 0.3, //Khi ta kéo sheet về 0.3 chiều cao của nó, nó sẽ đóng
      maxChildSize: 0.95, //Chiều cao tối đa của sheet được phép kéo lên
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
          child: Column(
            children: [
              SearchBy(
                searchBy: "Search",
                spaceBetween: 220,
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
                height: 32.h,
              ),
              const SearchBy(
                iconData: CupertinoIcons.arrow_2_circlepath,
                searchBy: "On going activities",
                trailing: ActivitesDrowDown(),
              ),
              Divider(
                thickness: 0.5.r,
                height: 32.h,
              ),
              SearchBy(
                iconData: Icons.calendar_today_outlined,
                searchBy: "By time",
                trailing: DateTimePicker(
                  initialDate: DateTime.now(),
                  onChanged: (value) {},
                ),
              ),
              Divider(
                thickness: 0.5.r,
                height: 32.h,
              ),
              SearchBy(
                iconData: Icons.abc,
                // searchBy: "By time",
                spaceBetween: 0,
                trailing: SizedBox(
                  width: 0.75.sw,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "By event name",
                        hintStyle: CustomGoogleFonts.roboto(
                            fontSize: 16.r, color: TextColor.placeholder)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 0.35.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xffffffff), width: 0.5.r)),
                      child: Text(
                        "Clear",
                        style: CustomGoogleFonts.roboto(
                            fontSize: 16.r, color: AppColors.white100),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 0.3.sw,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFFF783A),
                            Color(0xFFF26322),
                          ])),
                      child: Text(
                        "Select",
                        style: CustomGoogleFonts.roboto(
                            fontSize: 16.r, color: AppColors.white100),
                      ),
                    ),
                  ),
                ],
              )
              // TimeRow(),
            ],
          ),
        );
      },
    );
  }
}
