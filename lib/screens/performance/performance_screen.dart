import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/fonts.dart';

import '../../config/fonts.dart';

class Performance extends StatelessWidget {
  const Performance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            Color.fromARGB(255, 24, 19, 63), // Set the status bar color
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: Container(
              color: Color.fromARGB(255, 24, 19, 63),
              child: Row(
                children: [
                  IconButton(
                    splashColor: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Performance metrics",
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 16.r),
                  ),
                  Spacer(),
                  Icon(Icons.home),
                ],
              ),
            )),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
