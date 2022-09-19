// import 'package:flutter/material.dart';
// import 'package:music_player/palettes/color_palette.dart';

// class MiniPlayer extends StatelessWidget {
//   const MiniPlayer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       height: 75,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: kBlue,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading: Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               color: kLightBlue,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(
//               Icons.music_note,
//               color: kDarkBlue,
//             ),
//           ),
//           title: const Text(
//             'Always',
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           subtitle: Text('Isak Danielson'),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Icon(
//                 Icons.skip_previous,
//                 color: kDarkBlue,
//                 size: 33,
//               ),
//               SizedBox(width: 15),
//               Icon(
//                 Icons.play_arrow,
//                 color: kDarkBlue,
//                 size: 33,
//               ),
//               SizedBox(width: 15),
//               Icon(
//                 Icons.skip_next,
//                 color: kDarkBlue,
//                 size: 33,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
