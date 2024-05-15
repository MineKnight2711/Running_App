import 'package:flutter/material.dart';
import '../../../config/config_export.dart';

class PreparationTypeTabbar extends StatefulWidget {
  final TabController tabController;
  final List<String> listButton;

  final Function(int index)? onSelectedIndex;
  const PreparationTypeTabbar({
    super.key,
    required this.listButton,
    this.onSelectedIndex,
    required this.tabController,
  });

  @override
  State<PreparationTypeTabbar> createState() => _PreparationTypeTabbarState();
}

class _PreparationTypeTabbarState extends State<PreparationTypeTabbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0x33FFFFFF), width: 1),
          borderRadius: BorderRadius.circular(50)),
      width: AppSpacings.widthByScreenWidth(1),
      height: AppSpacings.customVerticalSpacing(35),
      child: TabBar(
        dividerHeight: 0,
        padding: const EdgeInsets.only(top: 2),
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        controller: widget.tabController,
        automaticIndicatorColorAdjustment: false,
        indicatorColor: Colors.transparent,
        labelStyle: CustomGoogleFonts.roboto(
            fontSize: AppFontSizes.size14,
            fontWeight: FontWeight.w700,
            color: AppColors.white100),
        unselectedLabelStyle: CustomGoogleFonts.roboto(
            fontSize: AppFontSizes.size14,
            fontWeight: FontWeight.w400,
            color: AppColors.white100),
        onTap: (value) {
          setState(() {
            currentIndex = widget.tabController.index = value;
          });
          if (widget.onSelectedIndex != null) {
            widget.onSelectedIndex!(value);
          }
        },
        tabs: [
          Container(
            width: AppSpacings.horizontalSpacing30 * 3,
            decoration: BoxDecoration(
              color: currentIndex == 0 ? const Color(0xfff26322) : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Tab(
              text: widget.listButton[0],
            ),
          ),
          Container(
            width: AppSpacings.horizontalSpacing30 * 3,
            decoration: BoxDecoration(
              color: currentIndex == 1 ? const Color(0xfff26322) : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Tab(
              text: widget.listButton[1],
            ),
          ),
          Container(
            width: AppSpacings.horizontalSpacing30 * 3,
            decoration: BoxDecoration(
              color: currentIndex == 2 ? const Color(0xfff26322) : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Tab(
              text: widget.listButton[2],
            ),
          ),
        ],
      ),
    );
  }
}
