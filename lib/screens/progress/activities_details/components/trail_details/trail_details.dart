import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../models/trail_model/trail_model.dart';
import 'components/trail_details_header.dart';
import 'components/trail_details_map.dart';

class TrailDetailsWidget extends StatelessWidget {
  final TrailModel trail;

  const TrailDetailsWidget({
    super.key,
    required this.trail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrailDetailsHeader(
          trail: trail,
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
              child: TrailDetailsMapWidget(
                // haveRPE: false,
                trail: trail,
              ),
            ),
          ],
        )
      ],
    );
  }
}
