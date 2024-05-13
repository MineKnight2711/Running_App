import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/fonts.dart';

class AudioGuidance extends StatefulWidget {
  const AudioGuidance({super.key});

  @override
  State<AudioGuidance> createState() => _AudioGuidanceState();
}

class _AudioGuidanceState extends State<AudioGuidance> {
  late String _selectedAudioGuidance;
  List<String> types = [
    'Go, stop, finish',
    'Completion every kilometer',
    'Exceed maximum pulse rate'
  ];
  @override
  void initState() {
    super.initState();
    _selectedAudioGuidance = types.first;
  }

  void _handleMapTypeChange(String type) {
    setState(() {
      _selectedAudioGuidance = type;
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
                  'Audio Guidance',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r, color: Colors.white),
                ),
                const Icon(CupertinoIcons.xmark, color: Colors.white),
              ],
            ),
            Divider(
              thickness: 0.5.r,
              height: 32,
            ),
            Column(
              children: types
                  .map(
                    (type) => AudioGuidanceOption(
                        type: type,
                        onSelected: (type) {
                          _handleMapTypeChange(type);
                        },
                        selectedType: _selectedAudioGuidance),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút "Complete"
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
                  'Done',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 345.0),
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

class AudioGuidanceOption extends StatelessWidget {
  final String type, selectedType;
  final Function(String) onSelected;
  const AudioGuidanceOption(
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
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: AppColors.basicActivitiesCard.withOpacity(0.9),
            ),
          ),
        ),
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
