// import 'package:flutter/material.dart';
// import 'package:music_player/function/alert_functions.dart';

// import 'package:on_audio_query/on_audio_query.dart';

// class ScreenFavourites extends StatelessWidget {
//   ScreenFavourites({super.key});
//   OnAudioQuery audioQuery = OnAudioQuery();
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
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
//         title: const Text(
//           'Favourites',
//           style: TextStyle(
//             fontSize: 21,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
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
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (item.data!.isEmpty) {
//               return Center(
//                 child: Text('No Songs Found...'),
//               );
//             }
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               itemCount: 7,
//               itemBuilder: (context, index) {
//                 return Song(
                  
//                   songList: item.data!,
//                   songName: item.data![index].displayNameWOExt,
//                   songArtist: item.data![index].artist.toString(),
//                   onPressed: () {
//                     showPlaylistModalSheet(context, screenHeight);
//                   },
//                   isFav: true,
//                   songPath: item.data![index].uri!,
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
