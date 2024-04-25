import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> bottomBarItems = [
    {
      'icon': 'progress',
      'label': 'Progress',
    },
    {
      'icon': 'preparation',
      'label': 'Preparation',
    },
    {
      'icon': 'ready',
      'label': 'Ready',
    },
    {
      'icon': 'train',
      'label': 'Train',
    },
    {
      'icon': 'challenge',
      'label': 'Challenge',
    },
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Container(
      color: const Color(0xff2c2a2d),
      height: 0.11.sh,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomBarItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: SizedBox(
              height: 50.h,
              // width: 75.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/bottom_bar/${item['icon']}.png",
                    color: isSelected ? Colors.orange : Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item['label'],
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      color: isSelected ? Colors.orange : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
