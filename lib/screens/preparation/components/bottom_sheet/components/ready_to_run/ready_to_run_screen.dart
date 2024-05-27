// import 'package:flutter/material.dart';
// import 'package:flutter_running_demo/config/config_export.dart';
// import 'package:flutter_running_demo/models/route_model/route_model.dart';
// import 'package:flutter_running_demo/screens/preparation/components/components_export.dart';
// import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/ready_to_run/ready_to_run_sheet.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../../../../../controllers/preparation_map_controller.dart';
// import '../../../../../../widgets/custom_map_widget/custom_map_widget.dart';

// class ReadyToRunScreen extends GetView {
//   final mapController = Get.find<MapController>();
//   final RouteModel route = Get.arguments;
//   ReadyToRunScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         leading: const Icon(Icons.close, color: AppColors.white100),
//         titleSpacing: 0,
//         backgroundColor: const Color(0xff2f2828).withOpacity(0.65),
//         title: Text(
//           'Ready to Run',
//           style: CustomGoogleFonts.roboto(
//             fontSize: AppFontSizes.size18,
//             color: TextColor.white,
//           ),
//         ),
//         actions: [
//           SvgPicture.asset("assets/svg/preparation/map_annotations/gps.svg"),
//           const SizedBox(width: 20),
//         ],
//       ),
//       body: Stack(
//         children: [
//           CustomMapWidget(
//             onMapCreate: (mapboxMap) {
//               mapController.onMapCreated(mapboxMap);
//             },
//             initialCoordinates: [
//               route.longitude,
//               route.latitude,
//             ],
//           ),
//           Positioned(
//             top: 150,
//             right: 0,
//             child: VerticalAnnotations(
//               isRouteSelected: false,
//               isRouteAdd: false,
//               onRotateMapPressed: () => mapController.changeMapDirection(),
//               onChangeStylePressed: () => mapController.changeMapStyle(),
//               onPrepareRoutePressed: () {},
//               onClosePress: () {},
//               onHandPress: () {},
//               onCheckPress: () {},
//               onUndoPress: () {},
//               onAddUndoPress: () {},
//             ),
//           ),
//           const Positioned(bottom: 0, child: ReadyToRunSheet()),
//         ],
//       ),
//     );
//   }
// }
