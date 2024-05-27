import 'package:flutter/material.dart';
import '../../../../../../../config/config_export.dart';

class MapTypeOption extends StatelessWidget {
  final String type, selectedType;
  final Function(String) onSelected;
  const MapTypeOption(
      {super.key,
      required this.type,
      required this.onSelected,
      required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(type);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: AppColors.basicActivitiesCard.withOpacity(0.9),
            ),
          ),
        ),
        height: AppSpacings.cvs(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: CustomGoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Radio(
              activeColor: AppColors.appButton,
              value: type,
              groupValue: selectedType,
              onChanged: (value) {
                onSelected(value.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
