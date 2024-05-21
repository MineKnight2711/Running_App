import 'package:flutter/material.dart';
import '../config/config_export.dart';

class TestVerticalListView extends StatelessWidget {
  final ScrollController scrollController;
  const TestVerticalListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      controller: scrollController,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: AppSpacings.widthByScreenWidth(1),
          height: AppSpacings.heightByScreenHeight(0.2),
          color: Colors.white,
          child: Text(
            (index += 1).toString(),
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size20,
            ),
          ),
        );
      },
    );
  }
}
