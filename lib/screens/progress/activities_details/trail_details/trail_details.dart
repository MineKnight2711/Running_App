import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/trail_details_footer.dart';
import 'components/trail_details_header.dart';

class TrailDetailsWidget extends StatelessWidget {
  const TrailDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TrailDetailsHeader(),
        Container(
          height: 0.25.sh,
          color: Colors.grey[200],
        ),
        const TrailDetailsFooter(),
      ],
    );
  }
}
