import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/colors.dart';
import '../../../../config/fonts.dart';

class MapSettingToRun extends StatefulWidget {
  const MapSettingToRun({super.key});

  @override
  _MapSettingToRunState createState() => _MapSettingToRunState();
}

class _MapSettingToRunState extends State<MapSettingToRun> {
  bool _isPublic = false;
  late String _selectedMapType;
  List<String> types = ['standard', 'satellite', 'hybrid'];
  @override
  void initState() {
    super.initState();
    _selectedMapType = types.first;
  }

  void _handleMapTypeChange(String type) {
    setState(() {
      _selectedMapType = type;
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Map Setting',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r, color: Colors.white),
                ),
                const Icon(CupertinoIcons.xmark, color: Colors.white),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Maps types',
              style:
                  CustomGoogleFonts.roboto(fontSize: 16.r, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Column(
              children: types
                  .map(
                    (type) => MapTypeOption(
                        type: type,
                        onSelected: (type) {
                          _handleMapTypeChange(type);
                        },
                        selectedType: _selectedMapType),
                  )
                  .toList(),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Xử lý khi nhấn nút "Complete"
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: AppColors.appButton,
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 150.0,
            //         vertical: 16.0,
            //       ),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     child: Text(
            //       'Agree',
            //       style: CustomGoogleFonts.roboto(
            //           fontSize: 20, color: Colors.white),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Layer enable',
              style:
                  CustomGoogleFonts.roboto(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.appButton,
              checkColor: Colors.white,
              title: Text(
                'Points of interests',
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
            const SizedBox(height: 280.0),
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

class MapTypeOption extends StatelessWidget {
  final String type, selectedType;
  final Function(String) onSelected;
  const MapTypeOption(
      {super.key,
      required this.type,
      required this.onSelected,
      required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(type);
      },
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: CustomGoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Radio(
              activeColor: AppColors.appButton,
              value: type,
              groupValue: selectedType,
              onChanged: (value) {
                onSelected(value.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
