import 'package:flutter/material.dart';
import '../../config/config_export.dart';
import 'package:flutter_running_demo/widgets/app_bar.dart';
import 'package:flutter_running_demo/widgets/home_action_button.dart';

class MetricInfo extends StatelessWidget {
  const MetricInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Metrics Info',
        onBackPress: () {
          AppRoutes.navigateBack();
        },
        secondaryAction: ActionButton(
          imagePath: "assets/svg/profile.svg",
          onTap: () {},
        ),
      ),
      body: Container(
        height: AppSpacings.sh(1),
        decoration: const BoxDecoration(
          gradient: AppColors.appTheme,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Et harum quidem rerum facilis est et expedita dists',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                'placeat facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Aumque nihil impedit quo minus id quod maxime.',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Et harum quidem rerum facilis est et expedita dists omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, ',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Et harum quidem rerum facilis est et expedita dists placeat facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Aumque nihil impedit quo minus id quod maxime.',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Et harum quidem rerum facilis est et expedita dists omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum neessit atibus saepe eveniet ut et voluptates repudiand facere possimus, omnis voluptas sumenda est, ',
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size14,
                  color: AppColors.white100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Thêm phần tử khác nếu cần
            ],
          ),
        ),
      ),
    );
  }
}
