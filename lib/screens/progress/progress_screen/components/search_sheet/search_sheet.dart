import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/components/search_sheet/sheet_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/date_time_picker.dart';
import 'activites_drow_down.dart';

class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55, //Kích cỡ sheet khi vừa hiện lên
      minChildSize: 0.3, //Khi ta kéo sheet về 0.3 chiều cao của nó, nó sẽ đóng
      maxChildSize: 0.95, //Chiều cao tối đa của sheet được phép kéo lên
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
          child: Column(
            children: [
              SheetRow(
                rowTitle: "Search",
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
              const SheetRow(
                iconData: CupertinoIcons.arrow_2_circlepath,
                rowTitle: "On going activities",
                trailing: ActivitesDrowDown(),
              ),
              Divider(
                thickness: 0.5.r,
                height: 32.h,
              ),
              SheetRow(
                iconData: Icons.calendar_today_outlined,
                rowTitle: "By time",
                trailing: DateTimePicker(
                  initialDate: DateTime.now(),
                  onChanged: (value) {},
                ),
              ),
              Divider(
                thickness: 0.5.r,
                height: 32.h,
              ),
              SheetRow(
                iconData: Icons.abc,
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
