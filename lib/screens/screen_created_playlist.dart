// import 'package:flutter/material.dart';

// import 'package:music_player/palettes/color_palette.dart';
// import 'package:music_player/widgets/song.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class ScreenCreatedPlaylist extends StatelessWidget {
//   ScreenCreatedPlaylist({super.key, required this.playlistName});
//   final String playlistName;
//   OnAudioQuery audioQuery = OnAudioQuery();
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           playlistName,
//           style: const TextStyle(
//             fontSize: 21,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.edit,
//               color: kLightBlue,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.add,
//               size: 27,
//               color: kLightBlue,
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
//         child: FutureBuilder<List<SongModel>>(
//           future: audioQuery.querySongs(
//             sortType: null,
//             orderType: OrderType.ASC_OR_SMALLER,
//             uriType: UriType.EXTERNAL,
//             ignoreCase: true,
//           ),
//           builder: (context, item) {
//             if (item.data == null) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (item.data!.isEmpty) {
//               return const Center(
//                 child: Text('No Songs Found...'),
//               );
//             }
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const ScrollPhysics(),
//               itemCount: 14,
//               itemBuilder: (context, index) {
//                 return Song(
//                   audioPlayer: ,
//                   index: index,
//                   songList: item.data!,
//                   onPressed: () {},
//                   isFav: (index % 2 == 0) ? true : false,
//                   icon: Icons.delete,
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
