import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/extensions/datetime_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onChanged;

  DateTimePicker({super.key, this.initialDate, this.onChanged});
  final Rx<DateTime?> _selectedDate = Rx<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    if (initialDate != null) {
      _selectedDate.value = initialDate;
    }
    return SizedBox(
      height: 1.sh / 19,
      width: 0.4.sw,
      child: ElevatedButton(
        onPressed: () {
          _selectDate(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Text(
                _selectedDate.value!.dateTimeFormatWithStringMonth(),
                style: CustomGoogleFonts.roboto(
                    fontSize: 16.r, color: Colors.white),
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Colors.green)
                .copyWith(secondary: Colors.green),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate.value) {
      _selectedDate.value = picked;
      onChanged!(picked);
    }
  }
}
