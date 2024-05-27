import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadPreparedRoadMap extends StatelessWidget {
  const LoadPreparedRoadMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.6.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Load prepared route map',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16, color: Colors.white),
                ),
                const Spacer(),
                const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.white,
                ),
              ],
            ),
            const Divider(
              thickness: 0.2,
              height: 35,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
