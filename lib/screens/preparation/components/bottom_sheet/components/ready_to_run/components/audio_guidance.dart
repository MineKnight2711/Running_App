import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/colors.dart';
import '../../../../../../../config/fonts.dart';

class AudioGuidance extends StatefulWidget {
  const AudioGuidance({super.key});

  @override
  State<AudioGuidance> createState() => _AudioGuidanceState();
}

class _AudioGuidanceState extends State<AudioGuidance> {
  late String _selectedAudioGuidance;
  List<String> types = [
    'Go, stop, finish',
    'Completion every kilometer',
    'Exceed maximum pulse rate'
  ];
  @override
  void initState() {
    super.initState();
    _selectedAudioGuidance = types.first;
  }

  void _handleMapTypeChange(String type) {
    setState(() {
      _selectedAudioGuidance = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: types
          .map(
            (type) => AudioGuidanceOption(
                type: type,
                onSelected: (type) {
                  _handleMapTypeChange(type);
                },
                selectedType: _selectedAudioGuidance),
          )
          .toList(),
    );
  }
}

class AudioGuidanceOption extends StatelessWidget {
  final String type, selectedType;
  final Function(String) onSelected;
  const AudioGuidanceOption(
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
        height: 50.h,
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
