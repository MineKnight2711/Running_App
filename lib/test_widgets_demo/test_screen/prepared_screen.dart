import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreparedScreen extends StatefulWidget {
  const PreparedScreen({super.key});

  @override
  @override
  State<PreparedScreen> createState() => _PreparedScreenState();
}

class _PreparedScreenState extends State<PreparedScreen> {
  final TextEditingController _routeNameController = TextEditingController();
  bool _isPublic = false;
  bool _addToUpcomingRunList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.5.sh,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _routeNameController,
              style:
                  CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Name your route',
                  hintStyle: CustomGoogleFonts.roboto(
                      fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Distance: 1.2km',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Elevation: 12m',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            CheckboxListTile(
              activeColor: const Color(0xfff26322),
              checkColor: Colors.white,
              title: Text(
                'Open to public',
                style:
                    CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
              ),
              value: _isPublic,
              onChanged: (value) {
                setState(() {
                  _isPublic = value!;
                });
              },
            ),
            CheckboxListTile(
              activeColor: const Color(0xfff26322),
              checkColor: Colors.white,
              title: Text(
                'Add to upcoming run list',
                style:
                    CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
              ),
              value: _addToUpcomingRunList,
              onChanged: (value) {
                setState(() {
                  _addToUpcomingRunList = value!;
                });
              },
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff26322)),
                onPressed: () {
                  // Xử lý khi nhấn nút "Save to favorites"
                },
                child: Text(
                  'Save to favorites',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
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
}
