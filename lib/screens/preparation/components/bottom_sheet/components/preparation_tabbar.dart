import 'package:flutter/material.dart';
import '../../../../../config/config_export.dart';

class PreparationTabbar extends StatefulWidget {
  final TabController tabController;
  final List<String> listButton;

  final Function(int index)? onSelectedIndex;
  const PreparationTabbar({
    super.key,
    required this.listButton,
    this.onSelectedIndex,
    required this.tabController,
  });

  @override
  State<PreparationTabbar> createState() => _PreparationTabbarState();
}

class _PreparationTabbarState extends State<PreparationTabbar> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabChange);
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      currentIndex = widget.tabController.index;
    });
    if (widget.onSelectedIndex != null) {
      widget.onSelectedIndex!(currentIndex);
    }
  }

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
          tabs: widget.listButton.asMap().entries.map((entry) {
            return Container(
              width: AppSpacings.horizontalSpacing30 * 3,
              decoration: BoxDecoration(
                color: currentIndex == entry.key ||
                        widget.tabController.index == entry.key
                    ? const Color(0xfff26322)
                    : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Tab(
                text: entry.value,
              ),
            );
          }).toList()),
    );
  }
}
