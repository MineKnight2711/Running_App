import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/performance/components/period_button_row.dart';

class TestPrepared extends StatelessWidget {
  final List<String> periodButtonRow = [
    'Favorites',
    'Add_new',
    'Upcoming',
  ];
  TestPrepared({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          height: 0.3.sh,
          decoration: const BoxDecoration(gradient: AppColors.appTheme),
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
              Row(
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    'No prepared route',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timeline, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.directions_run, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sports, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.signal_cellular_alt,
                        color: Colors.white),
                  ),
                ],
              ),
              // AspectRatio(aspectRatio: 2, child: TestChart()),
            ],
          ),
        ),
      ),
    );
  }
}
