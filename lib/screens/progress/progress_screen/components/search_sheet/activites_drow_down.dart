import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';

class ActivitesDrowDown extends StatefulWidget {
  const ActivitesDrowDown({super.key});

  @override
  ActivitesDrowDownState createState() => ActivitesDrowDownState();
}

class ActivitesDrowDownState extends State<ActivitesDrowDown> {
  String? selectedValue = 'All';
  List<String> options = ['All', 'Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      dropdownColor: Colors.grey,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
      iconSize: 24,
      elevation: 16,
      style:
          CustomGoogleFonts.roboto(fontSize: 14.r, color: AppColors.white100),
      underline: Container(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: options.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
