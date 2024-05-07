import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/performance/components/period_button_row.dart';

class PreparedNote extends StatelessWidget {
  final List<String> periodButtonRow = [
    'Favorites',
    'Add_new',
    'Upcoming',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.4.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
        ),
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeriodButtonRow(
              listButton: periodButtonRow,
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Find your running place',
                    hintStyle: CustomGoogleFonts.roboto(
                        fontSize: 14, color: TextColor.placeholder),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    fillColor: Colors.white),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.directions_run,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Press running man icon to check existing route and save to your favorite or upcoming run',
                      style: CustomGoogleFonts.roboto(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.touch_app,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Press and hold a point on the map or press the hand icon to add waypoints along the route',
                      style: CustomGoogleFonts.roboto(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Use the pen icon to directly draw path',
                      style: CustomGoogleFonts.roboto(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Progress"
                  },
                  icon: const Icon(Icons.timeline, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Preparation"
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Ready"
                  },
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Train"
                  },
                  icon: const Icon(Icons.directions_run, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Challenge"
                  },
                  icon: const Icon(Icons.emoji_events, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
