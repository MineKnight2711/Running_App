import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPreparationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(gradient: AppColors.appTheme),
          height: 0.5.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name Your Route',
                style: CustomGoogleFonts.roboto(
                    fontSize: 16.r, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance: 1.2 km',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 14.r, color: Colors.white),
                  ),
                  Text(
                    'Elevation: 12 m',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 14.r, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Open to public',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Add to upcoming run list',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save to favorites'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.timeline, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.directions_run, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sports, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.signal_cellular_alt, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
