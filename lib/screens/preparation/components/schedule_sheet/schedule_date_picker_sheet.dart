import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/config_export.dart';
import '../../../../widgets/alert_dialogs/confirm_alert_dialogs.dart';
import 'schedule_date_picker_column.dart';
import 'schedule_sheet_action_buttons.dart';

class ScheduleDatePickerSheet extends StatelessWidget {
  final DateTime initialDate;
  const ScheduleDatePickerSheet({
    super.key,
    required this.initialDate,
  });
  final listMonth = const [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final RxInt seletedHours = 0.obs;
    final RxInt seletedMinutes = 0.obs;
    final RxInt selectedDay = initialDate.day.obs;
    final RxInt selectedMonth = initialDate.month.obs;
    final RxInt selectedYear = initialDate.year.obs;
    final listYear = List.generate(10, (index) => selectedYear.value + index);
    return Column(
      children: [
        SizedBox(
          height: AppSpacings.cvs(195),
          width: AppSpacings.sw(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScheduleDatePickerSheetColumn(
                initialValue: seletedHours.value,
                values: List.generate(24, (index) => index),
                onChanged: (value) {
                  seletedHours.value = value;
                },
                label: 'Hour',
              ),
              ScheduleDatePickerSheetColumn(
                initialValue: seletedMinutes.value,
                values: List.generate(60, (index) => index),
                onChanged: (value) {
                  seletedMinutes.value = value;
                },
                label: 'Minute',
              ),
              const VerticalDivider(
                width: 20,
                thickness: 0.5,
                indent: 80,
                endIndent: 45,
                color: Colors.grey,
              ),
              Obx(
                () => ScheduleDatePickerSheetColumn(
                  initialValue: selectedDay.value - 1,
                  values: List.generate(
                      getDaysInMonth(selectedYear.value, selectedMonth.value),
                      (index) => index + 1),
                  onChanged: (value) {
                    selectedDay.value = value;
                  },
                  label: 'Date',
                ),
              ),
              ScheduleDatePickerSheetColumn(
                initialValue: selectedMonth.value - 1,
                values: listMonth,
                onChanged: (value) {
                  selectedMonth.value = listMonth.indexOf(value);
                },
                label: 'Month',
              ),
              ScheduleDatePickerSheetColumn(
                initialValue: listYear.indexOf(selectedYear.value),
                values: listYear,
                onChanged: (value) {
                  selectedYear.value = value;
                },
                label: 'Year',
              ),
            ],
          ),
        ),
        ScheduleSheetActionButtons(
          onSavePressed: () {
            seletecScheduleTime(
              seletedHours.value,
              seletedMinutes.value,
              selectedDay.value,
              selectedMonth.value,
              selectedYear.value,
            );
          },
          onDeletePressed: () {
            Get.dialog(ConfirmAlertDialogs(
                title: 'Remove confirmation',
                content: Text(
                  "Are you sure you want to remove the route for upcoming run?",
                  textAlign: TextAlign.center,
                  style: CustomGoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                confirmButtonText: "Yes, remove",
                iconSvgPath: "delete_schedule"));
          },
        ),
      ],
    );
  }

  String seletecScheduleTime(
      int hours, int minutes, int day, int month, int year) {
    String timeSelected = "";
    if (hours != 0 || minutes != 0) {
      timeSelected = "${hours}h:${minutes}m | $year-$month-$day";
      Get.dialog(
        SizedBox(
          width: AppSpacings.sw(0.5),
          height: AppSpacings.sh(0.7),
          child: ConfirmAlertDialogs(
            confirmButtonText: "Ok",
            title: "You have successfully choose schedule time!",
            content: Text(
              timeSelected,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: TextColor.white,
              ),
              textAlign: TextAlign.center,
            ),
            iconSvgPath: "assets/svg/preparation/rpe/4-6.svg",
          ),
        ),
      );
    } else {
      Get.dialog(
        SizedBox(
          width: AppSpacings.sw(0.5),
          height: AppSpacings.sh(0.7),
          child: const ConfirmAlertDialogs(
            confirmButtonText: "Ok",
            title: "You haven't choose the times yet!",
            content: SizedBox.shrink(),
            iconSvgPath: "assets/svg/preparation/rpe/7-8.svg",
          ),
        ),
      );
    }
    return timeSelected;
  }

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 2, 0).day;
  }
}
