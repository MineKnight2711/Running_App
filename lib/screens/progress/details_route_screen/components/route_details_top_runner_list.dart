import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/datetime_extension.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import '../../../../config/config_export.dart';
import '../../../../models/runner_model.dart/runner_model.dart';

class RouteDetailsTopRunnerList extends StatelessWidget {
  const RouteDetailsTopRunnerList({
    super.key,
    required this.topRunners,
  });

  final List<RunnerModel> topRunners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacings.sw(1),
      height: topRunners.length * AppSpacings.cvs(80) + 35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: AppSpacings.hs15),
              Text(
                'Top runners',
                style: CustomGoogleFonts.roboto(
                  color: TextColor.white,
                  fontSize: AppFontSizes.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: AppSpacings.hs30 * 5.2),
              Text(
                'Record',
                style: CustomGoogleFonts.roboto(
                  color: TextColor.white,
                  fontSize: AppFontSizes.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacings.vs10),
          ...topRunners.map(
            (runner) => RunnerTile(
              runner: runner,
            ),
          )
        ],
      ),
    );
  }
}

class RunnerTile extends StatelessWidget {
  final RunnerModel runner;
  const RunnerTile({super.key, required this.runner});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacings.cvs(75),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                runner.id.toString(),
                style: CustomGoogleFonts.roboto(
                  color: TextColor.white,
                  fontSize: AppFontSizes.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: AppSpacings.hs10),
              Image.asset(
                  "assets/images/details_route_images/runners/${runner.name}.png"),
              SizedBox(width: AppSpacings.hs15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      runner.name,
                      style: CustomGoogleFonts.roboto(
                        color: TextColor.white,
                        fontSize: AppFontSizes.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      runner.dateRecord.dateTimeFormatWithStringMonth(),
                      style: CustomGoogleFonts.roboto(
                        color: TextColor.white,
                        fontSize: AppFontSizes.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    runner.time.durationToString(),
                    style: CustomGoogleFonts.roboto(
                      color: TextColor.white,
                      fontSize: AppFontSizes.size14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "${runner.record.toStringAsFixed(2)} /km",
                    style: CustomGoogleFonts.roboto(
                      color: TextColor.white,
                      fontSize: AppFontSizes.size14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: AppSpacings.vs25,
            thickness: 0.5,
            indent: AppSpacings.hs15 * 1.2,
          )
        ],
      ),
    );
  }
}
