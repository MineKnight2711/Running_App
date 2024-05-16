import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';
import 'schedule_date_picker.dart';

class PreparationScheduleSheet extends StatelessWidget {
  const PreparationScheduleSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacings.heightByScreenHeight(0.5),
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
                'Schedule',
                style:
                    CustomGoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
              const Spacer(),
              const Icon(CupertinoIcons.xmark, color: Colors.white),
            ],
          ),
          const Divider(
            thickness: 0.5,
            height: 20,
          ),
          ScheduleDatePicker(
            initialDate: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
