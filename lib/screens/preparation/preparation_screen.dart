import 'package:flutter/material.dart';
import '../../config/config_export.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/map_controller.dart';
import '../../utils/navigator_key.dart';
import '../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import 'components/components_export.dart';
import 'data/list_top_route_model.dart';

enum PreparationType { favorites, addNew, upcoming }

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _tabController;
  final currentPreparationType = PreparationType.favorites.obs;
  final mapController = Get.find<MapController>();
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: PreparationType.values.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<String> preTypes = [
      'Favorites',
      'Add-new',
      'Upcoming',
    ];

    return Scaffold(
      body: Stack(
        children: [
          CustomMapWidget(
            onMapCreate: (mapBoxMap) {
              mapController.onMapCreated(mapBoxMap);
              mapController.createTempTopRoutes();
            },
          ),
          Positioned(top: 40, child: HorizontalAnnotations()),
          Positioned(
              top: 200,
              right: 0,
              child: VerticalAnnotations(
                onPrepareRoutePressed: () {
                  showModalBottomSheet(
                    context:
                        NavigatorKeys.secondaryNavigatorKey.currentContext!,
                    // isScrollControlled: true,
                    // shape: const RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(20),
                    //     topRight: Radius.circular(20),
                    //   ),
                    // ),
                    // enableDrag: true,
                    // backgroundColor: const Color(0xff222222),
                    builder: (context) {
                      // return DraggableScrollableSheet(

                      //   maxChildSize: 0.9,
                      //   minChildSize: 0.25,
                      //   initialChildSize: 0.9,
                      //   expand: false,

                      //   builder: (context, scrollController) {
                      //     return Column(
                      //       children: [
                      //         Container(
                      //             width: AppSpacings.widthByScreenWidth(1),
                      //             height: AppSpacings.heightByScreenHeight(0.1),
                      //             color: Colors.white),
                      //       ],
                      //     );
                      //   },
                      // );
                      return CustomDraggableSheetWidget(
                        grabberBottom: Container(
                            width: AppSpacings.widthByScreenWidth(1),
                            height: AppSpacings.heightByScreenHeight(0.1),
                            color: Colors.white),
                        sheetBody: (context, scrollController) {
                          return Container(
                            color: Colors.yellow,
                            width: AppSpacings.widthByScreenWidth(1),
                            height: AppSpacings.heightByScreenHeight(0.8),
                          );
                        },
                      );
                    },
                  );
                },
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomDraggableSheetWidget(
              grabberBottom: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreparationTabbar(
                    listButton: preTypes,
                    tabController: _tabController,
                    onSelectedIndex: onSelectedIndex,
                  ),
                  SizedBox(height: AppSpacings.verticalSpacing10),
                  sheetBodyTitle,
                  SizedBox(height: AppSpacings.verticalSpacing5),
                ],
              ),
              sheetBody: (context, scrollController) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    RoutePreparationList(
                      scrollController: scrollController,
                      routes: tempTopRoute,
                    ),
                    Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 10,
                          leading: SvgPicture.asset(
                            "assets/svg/preparation/add_new_route/run.svg",
                          ),
                          title: Text(
                            "Press running man icon to check existing route and save to your favorite or upcoming run",
                            style: CustomGoogleFonts.roboto(
                              fontSize: AppFontSizes.size14,
                              color: AppColors.white100,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 10,
                          leading: SvgPicture.asset(
                              "assets/svg/preparation/add_new_route/hand.svg"),
                          title: Text(
                            "Press and hold a point on the map or press the hand icon to add waypoints along the route",
                            style: CustomGoogleFonts.roboto(
                              fontSize: AppFontSizes.size14,
                              color: AppColors.white100,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 10,
                          leading: SvgPicture.asset(
                              "assets/svg/preparation/add_new_route/pen.svg"),
                          title: Text(
                            "Use the pen icon to directly draw path",
                            style: CustomGoogleFonts.roboto(
                              fontSize: AppFontSizes.size14,
                              color: AppColors.white100,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // RoutePreparationList(
                    //   scrollController: scrollController,
                    //   routes: tempTopRoute,
                    // ),
                    UpcomingListRoute(
                      scrollController: scrollController,
                      anyTimeRoutes: tempTopRoute.sublist(0, 2),
                      byTimeRoutes: tempTopRoute.sublist(
                          tempTopRoute.length - 1, tempTopRoute.length),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget get sheetBodyTitle {
    return Obx(() {
      switch (currentPreparationType.value) {
        case PreparationType.favorites:
          return Text(
            "Top ${tempTopRoute.length} routes",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: AppColors.white100,
              fontWeight: FontWeight.w400,
            ),
          );
        case PreparationType.addNew:
          return TextField(
            decoration: InputDecoration(
              hintText: 'Find your running place',
              hintStyle: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: TextColor.secondaryText,
                fontWeight: FontWeight.w400,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 60,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  "assets/svg/search.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: TextColor.white,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.white,
          );

        case PreparationType.upcoming:
          return Text(
            "Total ${tempTopRoute.sublist(0, 2).length} prepared routes",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: AppColors.white100,
              fontWeight: FontWeight.w400,
            ),
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }

  onSelectedIndex(int index) {
    switch (index) {
      case 0:
        currentPreparationType.value = PreparationType.favorites;
        break;
      case 1:
        currentPreparationType.value = PreparationType.addNew;
        break;
      case 2:
        currentPreparationType.value = PreparationType.upcoming;
        break;
      default:
        break;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
