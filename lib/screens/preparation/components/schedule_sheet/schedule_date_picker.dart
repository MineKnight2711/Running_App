import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/config_export.dart';
import '../../../../widgets/alert_dialogs/warning_alert_dialogs.dart';
import 'schedule_date_picker_column.dart';
import 'schedule_sheet_action_buttons.dart';

class ScheduleDatePicker extends StatelessWidget {
  final DateTime initialDate;
  const ScheduleDatePicker({
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
          height: AppSpacings.customVerticalSpacing(190),
          width: AppSpacings.widthByScreenWidth(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScheduleDatePickerColumn(
                initialValue: seletedHours.value,
                values: List.generate(24, (index) => index),
                onChanged: (value) {
                  seletedHours.value = value;
                },
                label: 'Hour',
              ),
              ScheduleDatePickerColumn(
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
                () => ScheduleDatePickerColumn(
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
              ScheduleDatePickerColumn(
                initialValue: selectedMonth.value - 1,
                values: listMonth,
                onChanged: (value) {
                  selectedMonth.value = listMonth.indexOf(value);
                },
                label: 'Month',
              ),
              ScheduleDatePickerColumn(
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
            seletecScheduleTime(seletedHours.value, seletedMinutes.value,
                selectedDay.value, selectedMonth.value, selectedYear.value);
          },
          onDeletePressed: () {},
        ),
      ],
    );
  }

  String seletecScheduleTime(
      int hours, int minutes, int day, int month, int year) {
    String timeSelected = "";
    if (hours > 0 && minutes > 0) {
    } else {
      Get.dialog(
        SizedBox(
          width: AppSpacings.widthByScreenWidth(0.5),
          height: AppSpacings.heightByScreenHeight(0.7),
          child: const WarningAlertDialogs(
            title: "You haven't choose the times yet!",
            content: SizedBox.shrink(),
            iconSvgPath: "assets/svg/preparation/rpe/2-3.svg",
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
