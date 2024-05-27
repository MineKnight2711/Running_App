import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/config_export.dart';
import 'components/map_type_options.dart';

class RunMapSettingsSheet extends StatefulWidget {
  const RunMapSettingsSheet({super.key});

  @override
  State<RunMapSettingsSheet> createState() => _RunMapSettingsSheetState();
}

class _RunMapSettingsSheetState extends State<RunMapSettingsSheet> {
  bool _isPublic = false;
  late String _selectedMapType;
  List<String> types = ['Standard', 'Satellite', 'Hybrid'];
  @override
  void initState() {
    super.initState();
    _selectedMapType = types.first;
  }

  void _handleMapTypeChange(String type) {
    setState(() {
      _selectedMapType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacings.sh(0.85),
      decoration: const BoxDecoration(
        color: AppColors.sheetBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacings.hs20,
        vertical: AppSpacings.vs10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Map Setting',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(CupertinoIcons.xmark, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Maps types',
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: types
                .map(
                  (type) => MapTypeOption(
                      type: type,
                      onSelected: (type) {
                        _handleMapTypeChange(type);
                      },
                      selectedType: _selectedMapType),
                )
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Layer enable',
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.appButton,
            checkColor: Colors.white,
            title: Text(
              'Points of interests',
              style:
                  CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
            ),
            value: _isPublic,
            onChanged: (value) {
              setState(() {
                _isPublic = value!;
              });
            },
          ),
          const SizedBox(height: 280.0),
        ],
      ),
    );
  }
}
