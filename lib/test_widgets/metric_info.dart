import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetricInfo extends StatelessWidget {
  const MetricInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
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
            const SizedBox(
              height: 80,
            ),
            Text(
              'Et harum quidem rerum facilis est et expedita dists',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),

            Text(
              'placeat facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Aumque nihil impedit quo minus id quod maxime.',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Et harum quidem rerum facilis est et expedita dists omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, ',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Et harum quidem rerum facilis est et expedita dists placeat facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Aumque nihil impedit quo minus id quod maxime.',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Et harum quidem rerum facilis est et expedita dists omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, ',
              style:
                  CustomGoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            // Thêm phần tử khác nếu cần
          ],
        ),
      ),
    );
  }
}
