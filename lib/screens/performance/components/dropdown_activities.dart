import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/dropdown_activities_model.dart';

class DropDownActivitiesMenu extends StatefulWidget {
  const DropDownActivitiesMenu({super.key});

  @override
  State<DropDownActivitiesMenu> createState() => _DropDownActivitiesMenuState();
}

class _DropDownActivitiesMenuState extends State<DropDownActivitiesMenu> {
  late ActivitiesDropDownModel _selected;
  List<ActivitiesDropDownModel> activitiesDropDownList = [
    ActivitiesDropDownModel(
      icon: Icons.run_circle_rounded,
      activityIndex: '4.2/km',
      achievements: "Longest run",
    ),
    ActivitiesDropDownModel(
      icon: Icons.hiking,
      activityIndex: '500m',
      achievements: "Highest hiking",
    ),
    ActivitiesDropDownModel(
      icon: Icons.directions_walk,
      activityIndex: '20km',
      achievements: "Longest walk",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selected = activitiesDropDownList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<ActivitiesDropDownModel>(
        isExpanded: true,
        isDense: true,
        value: _selected,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(),
        onChanged: (newValue) {
          setState(() {
            _selected = newValue!;
          });
        },
        items: activitiesDropDownList
            .map<DropdownMenuItem<ActivitiesDropDownModel>>((value) {
          return DropdownMenuItem<ActivitiesDropDownModel>(
            value: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  value.icon,
                  color: value == _selected ? Colors.grey : Colors.black,
                ),
                Text(
                  '${value.activityIndex} - ${value.achievements}',
                  style: TextStyle(
                      color: value == _selected ? Colors.grey : Colors.black),
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
