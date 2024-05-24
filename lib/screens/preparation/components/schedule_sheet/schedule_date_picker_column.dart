import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class ScheduleDatePickerColumn extends StatelessWidget {
  final List<dynamic> values;
  final ValueChanged<dynamic> onChanged;
  final String label;
  final int initialValue;
  const ScheduleDatePickerColumn({
    super.key,
    required this.values,
    required this.onChanged,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 8,
        // ),
        Text(
          label,
          style: CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          width: AppSpacings.chs(60),
          height: AppSpacings.cvs(170),
          child: ListWheelScrollView(
            itemExtent: 30,
            perspective: 0.01,
            overAndUnderCenterOpacity: 0.3,
            diameterRatio: 1.5,
            controller: FixedExtentScrollController(initialItem: initialValue),
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (value) {
              onChanged(values[value]);
            },
            children: values.map((value) {
              return Center(
                child: Text(
                  value.toString(),
                  style: CustomGoogleFonts.roboto(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
