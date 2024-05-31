import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../config/config_export.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/components/search_sheet/sheet_row.dart';
import '../../../../../widgets/date_time_picker.dart';
import 'activites_drow_down.dart';

class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode searchFocusNode = FocusNode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SheetRow(
          iconData: CupertinoIcons.arrow_2_circlepath,
          rowTitle: "On going activities",
          trailing: ActivitesDrowDown(),
        ),
        const Divider(
          thickness: 0.5,
          height: 32,
        ),
        SheetRow(
          iconData: Icons.calendar_today_outlined,
          rowTitle: "By time",
          trailing: DateTimePicker(
            initialDate: DateTime.now(),
            onChanged: (value) {},
          ),
        ),
        const Divider(
          thickness: 0.5,
          height: 32,
        ),
        SheetRow(
          iconData: Icons.abc,
          spaceBetween: 0,
          trailing: SizedBox(
            width: AppSpacings.sw(0.75),
            child: TextField(
              onTap: () {
                searchFocusNode.requestFocus();
              },
              focusNode: searchFocusNode,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: TextColor.white,
              ),
              decoration: InputDecoration(
                hintText: "By event name",
                hintStyle: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size16,
                  color: TextColor.placeholder,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSpacings.cvs(30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                width: AppSpacings.sw(0.35),
                height: AppSpacings.cvs(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffffffff),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  "Clear",
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size16,
                    color: AppColors.white100,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                width: AppSpacings.sw(0.3),
                height: AppSpacings.cvs(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFFF783A),
                      Color(0xFFF26322),
                    ])),
                child: Text(
                  "Select",
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size16,
                    color: AppColors.white100,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
