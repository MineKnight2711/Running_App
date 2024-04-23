import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/screens/progress/activities/components/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';

class ActivitiesDetailsScreen extends GetView {
  const ActivitiesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
          clipBehavior: Clip.none,
          decoration: const BoxDecoration(gradient: AppColors.appTheme),
          // padding: EdgeInsets.only(top: 80.h),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverLayoutBuilder(
                    builder: (context, constraints) {
                      final isScrolledUnder =
                          (constraints.scrollOffset > 160.h - 50);
                      return SliverAppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 2,
                        expandedHeight: 160.h,
                        floating: true,
                        pinned: true,

                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: isScrolledUnder
                              ? EdgeInsets.only(left: 230.w, bottom: 12.h)
                              : EdgeInsets.only(top: 20.w),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TransformButton(
                                transForm: isScrolledUnder,
                                title: "Search",
                                onPressed: () {},
                                imageAsset:
                                    "assets/images/activities_details/search.png",
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TransformButton(
                                transForm: isScrolledUnder,
                                title: "Chart",
                                onPressed: () {},
                                imageAsset:
                                    "assets/images/activities_details/chart.png",
                              ),
                            ],
                          ),
                          // centerTitle: true,
                        ),
                        //title: Text('My App Bar'),
                        leading: Icon(
                          Icons.arrow_back,
                          color: AppColors.white100,
                        ),
                        actions: [
                          SizedBox(width: 12),
                          Image.asset(
                            "assets/images/home.png",
                            scale: 1.1,
                          ),
                          SizedBox(width: 12),
                        ],
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: 1.sw,
                      // height: 0.8.sh,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 1.sw,
                            height: 1.sh,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: TrailDetailsWidget(),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 70,
                child: Image.asset(
                    "assets/images/activities_details/activities_details_banner.png"),
              ),
            ],
          )),
    );
  }
}

class TransformButton extends StatelessWidget {
  final bool transForm;
  final String title, imageAsset;
  final VoidCallback onPressed;

  const TransformButton(
      {super.key,
      required this.transForm,
      required this.title,
      required this.onPressed,
      required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return transForm
        ? InkWell(
            splashColor: Colors.blue,
            onTap: onPressed,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.transparent,
              backgroundImage: Image.asset(
                imageAsset,
                scale: 1.1,
              ).image,
            ))
        : InkWell(
            splashColor: Colors.blue,
            onTap: onPressed,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.basicActivitiesCard,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: 90.w,
              height: 25.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAsset,
                    // fit: BoxFit.fill,
                    scale: 1.4,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(title,
                      style: CustomGoogleFonts.roboto(
                          fontSize: 10.r, color: AppColors.white100))
                ],
              ),
            ),
          );
  }
}

class TrailDetailsWidget extends StatelessWidget {
  const TrailDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          color: Colors.grey[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 42.w,
                height: 52.w,
                margin: EdgeInsets.symmetric(vertical: 10.w),
                decoration: BoxDecoration(
                  color: const Color(0x0DFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset(
                      "assets/images/actions/walk.png",
                    ).image,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 0.8.sw,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Dam sen Trail",
                          style: CustomGoogleFonts.roboto(
                              fontSize: 16.r, color: AppColors.white100),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                            "assets/images/activities_details/people.png"),
                        const Spacer(),
                        Image.asset(
                          "assets/images/activities_details/info.png",
                          scale: 0.85,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          "assets/images/activities_details/share.png",
                          scale: 0.85,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '8/16/2023 | 6:45 AM',
                        style: CustomGoogleFonts.roboto(
                            fontSize: 12.r,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFB4AEAB)),
                      ),
                      Text(
                        '| District 11, HCMC',
                        style: CustomGoogleFonts.roboto(
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // CircleAvatar(
              //   backgroundColor: Colors.green,
              //   child: Text(
              //     'RPE',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: 0.25.sh,
          color: Colors.grey[200],
        ),
        Container(
          height: 60,
          color: Colors.grey[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Distance',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '4.8 km',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '00:15:57',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pace',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '3:12/km',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ascent',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '2m',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Calories',
                      textAlign: TextAlign.start,
                      style: CustomGoogleFonts.roboto(
                        fontSize: 12.r,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFB4AEAB),
                      ),
                    ),
                    Text(
                      '328',
                      style: CustomGoogleFonts.roboto(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
