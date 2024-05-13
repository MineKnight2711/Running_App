import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedHour = 3;

  int _selectedMinute = 39;

  int _selectedDate = 13;

  int _selectedMonth = 8;
  // Tháng Tháng 9 (September)
  int _selectedYear = 2023;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.85.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Schedule',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.xmark, color: Colors.white),
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 20,
            ),
            SizedBox(
              height: 360,
              width: 1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildWheelScroll(
                        values: List.generate(24, (index) => index),
                        selectedValue: _selectedHour,
                        onChanged: (value) =>
                            setState(() => _selectedHour = value),
                        label: 'Hour',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _buildWheelScroll(
                          values: List.generate(60, (index) => index),
                          selectedValue: _selectedMinute,
                          onChanged: (value) =>
                              setState(() => _selectedMinute = value),
                          label: 'Minute'),
                    ],
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 0.5,
                    indent: 80,
                    endIndent: 45,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      _buildWheelScroll(
                        values: List.generate(31, (index) => index + 1),
                        selectedValue: _selectedDate,
                        onChanged: (value) =>
                            setState(() => _selectedDate = value),
                        label: 'Date',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _buildWheelScroll(
                        values: [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec'
                        ],
                        selectedValue: _selectedMonth,
                        onChanged: (value) =>
                            setState(() => _selectedMonth = value),
                        label: 'Month',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _buildWheelScroll(
                        values: List.generate(10, (index) => 2023 + index),
                        selectedValue: _selectedYear,
                        onChanged: (value) =>
                            setState(() => _selectedYear = value),
                        label: 'Year',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút Save
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appButton,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 160.0,
                    vertical: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi nhấn nút Delete the scheduled route
              },
              child: Center(
                child: Text(
                  'Delete the scheduled route',
                  style: CustomGoogleFonts.roboto(
                    fontSize: 20,
                    color: const Color(0xffff4747),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Progress"
                  },
                  icon: const Icon(Icons.timeline),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Preparation"
                  },
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Ready"
                  },
                  icon: const Icon(Icons.check_circle),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Train"
                  },
                  icon: const Icon(Icons.directions_run),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Xử lý khi nhấn nút "Challenge"
                  },
                  icon: const Icon(Icons.emoji_events),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWheelScroll({
    required List<dynamic> values,
    required int selectedValue,
    required ValueChanged<dynamic> onChanged,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: 70,
            height: 300.0,
            child: ListWheelScrollView(
              itemExtent: 50.0,
              perspective: 0.009,
              overAndUnderCenterOpacity: 0.7,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: onChanged,
              children: values.map((value) {
                return Center(
                  child: Text(
                    value.toString(),
                    style: CustomGoogleFonts.roboto(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: selectedValue == value
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
