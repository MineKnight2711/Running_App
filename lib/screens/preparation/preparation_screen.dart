import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/config/spacings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/map_controller.dart';
import '../../models/top_route_model/top_route_model.dart';
import '../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import 'components/components_export.dart';
import 'components/preparation_tabbar.dart';
import 'components/top_route_item.dart';
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
              mapController.createTempTopRoutes(tempTopRoute);
            },
          ),
          Positioned(
            top: 40,
            // left: 10,
            child: HorizontalAnnotations(),
          ),
          Positioned(top: 200, right: 0, child: VerticalAnnotations()),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomDraggableSheetWidget(
              grabberBottom: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreparationTypeTabbar(
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
                    RoutePreparationList(
                      scrollController: scrollController,
                      routes: tempTopRoute,
                    ),
                    UpcomingRoute(
                      scrollController: scrollController,
                      anyTimeRoutes: tempTopRoute.sublist(0, 2),
                      byTimeRoutes: tempTopRoute.sublist(0, 1),
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

class UpcomingRoute extends StatelessWidget {
  final List<TopRouteModel> anyTimeRoutes;
  final List<TopRouteModel> byTimeRoutes;
  final ScrollController? scrollController;
  const UpcomingRoute({
    super.key,
    required this.scrollController,
    required this.anyTimeRoutes,
    required this.byTimeRoutes,
  });

  @override
  Widget build(BuildContext context) {
    final Rxn<TopRouteModel> selectedRoute = Rxn<TopRouteModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Anytime (${anyTimeRoutes.length})",
          style: CustomGoogleFonts.roboto(
            fontSize: AppFontSizes.size16,
            color: TextColor.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "By time (${byTimeRoutes.length})",
          style: CustomGoogleFonts.roboto(
            fontSize: AppFontSizes.size16,
            color: TextColor.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// ListView.builder(
//       padding: EdgeInsets.zero,
//       controller: scrollController, // assign controller here
//       itemCount: routes.length,
//       itemBuilder: (_, index) => GestureDetector(
//         onTap: () => selectedRoute.value = routes[index],
//         child: Obx(
//           () => RouteItemWidget(
//             isSelected: selectedRoute.value == routes[index],
//             route: routes[index],
//           ),
//         ),
//       ),
//     );
class RoutePreparationList extends StatelessWidget {
  final List<TopRouteModel> routes;
  final ScrollController scrollController;
  const RoutePreparationList({
    super.key,
    required this.routes,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final Rxn<TopRouteModel> selectedRoute = Rxn<TopRouteModel>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: scrollController, // assign controller here
      itemCount: routes.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () => selectedRoute.value = routes[index],
        child: Obx(
          () => RouteItemWidget(
            isSelected: selectedRoute.value == routes[index],
            route: routes[index],
          ),
        ),
      ),
    );
  }
}
