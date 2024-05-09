import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/dropdown_activities_model.dart';

class DropDownActivitiesMenu extends StatefulWidget {
  final List<ActivitiesDropDownModel> activitiesList;
  const DropDownActivitiesMenu({super.key, required this.activitiesList});

  @override
  State<DropDownActivitiesMenu> createState() => _DropDownActivitiesMenuState();
}

class _DropDownActivitiesMenuState extends State<DropDownActivitiesMenu> {
  late ActivitiesDropDownModel _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.activitiesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      // margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.basicActivitiesCard,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<ActivitiesDropDownModel>(
        isExpanded: true,
        // isDense: true,
        dropdownColor: Colors.black,
        value: _selected,
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.white100),
        iconSize: 24,
        elevation: 16,
        style: CustomGoogleFonts.roboto(fontSize: 16.r),
        underline: Container(),
        onChanged: (newValue) {
          setState(() {
            _selected = newValue!;
          });
        },
        items: widget.activitiesList.map((value) {
          return DropdownMenuItem<ActivitiesDropDownModel>(
            value: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  value.icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: '${value.activityIndex} - ',
                          style: CustomGoogleFonts.roboto(
                            fontSize: 16.r,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: value.achievements,
                          style: CustomGoogleFonts.roboto(
                            fontSize: 14.r,
                            color: const Color(0xFFB4AEAB),
                          ),
                        )
                      ]),
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
