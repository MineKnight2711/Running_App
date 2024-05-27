import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RunStop extends StatelessWidget {
//   const RunStop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 0.2.sh,
//         decoration: const BoxDecoration(
//           color: Color(0xFF222222),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//           ),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Icon(Icons.directions_walk, color: Colors.white),
//                     Text(
//                       '800m',
//                       style: CustomGoogleFonts.roboto(
//                           color: Colors.white, fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Icon(
//                       Icons.access_time,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       '4m 15s',
//                       style: CustomGoogleFonts.roboto(
//                           color: Colors.white, fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Icon(Icons.speed, color: Colors.white),
//                     Text('5.21/km',
//                         style: CustomGoogleFonts.roboto(
//                             color: Colors.white, fontSize: 14)),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Icon(
//                       Icons.favorite,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       '120',
//                       style: CustomGoogleFonts.roboto(
//                           color: Colors.white, fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Icon(Icons.camera, size: 32, color: Colors.white),
//                 const SizedBox(width: 5),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Xử lý sự kiện khi nhấn nút Stop
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.appButton,
//                     padding: const EdgeInsets.all(30),
//                     shape: const CircleBorder(),
//                   ),
//                   child: const Text(
//                     'Finish',
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ),
//                 Text(
//                   'Resume',
//                   style: CustomGoogleFonts.roboto(
//                       fontSize: 20, color: Colors.white),
//                 ),
//                 const SizedBox(width: 5),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
