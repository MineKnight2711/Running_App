import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/utils/data_convert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/trail_details_footer.dart';
import 'components/trail_details_header.dart';

class TrailDetailsWidget extends StatelessWidget {
  final String title, place;
  final double distance, pace, calories, ascent;
  final int totalTime;
  final bool haveInfo;
  final DateTime date;

  const TrailDetailsWidget(
      {super.key,
      required this.title,
      required this.place,
      required this.totalTime,
      required this.ascent,
      required this.distance,
      required this.pace,
      required this.calories,
      required this.date,
      required this.haveInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrailDetailsHeader(
          date: DataConvert.dateTimeFormat(date),
          haveInfo: haveInfo,
          place: place,
          title: title,
        ),
        Stack(
          children: [
            Container(
              width: 1.sw,
              height: 0.3.sh,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        Image.asset("assets/images/activities_details/map.png")
                            .image,
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: TrailDetailsFooter(
                ascent: ascent,
                calories: calories,
                distance: distance,
                pace: pace,
                time: DataConvert.minutesFromSeconds(totalTime),
              ),
            ),
          ],
        )
      ],
    );
  }
}
