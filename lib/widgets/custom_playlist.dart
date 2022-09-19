import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class CustomPlaylist extends StatelessWidget {
  const CustomPlaylist({
    Key? key,
    required this.playlistImage,
    required this.playlistName,
    required this.playlistSongNum,
  }) : super(key: key);
  final String playlistImage;
  final String playlistName;
  final String playlistSongNum;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(right: 14),
      // width: 120,
      width: screenWidth * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              playlistImage,
              fit: BoxFit.cover,
              // height: 137,
              height: screenHeight * 0.16,
            ),
          ),
          Text(
            playlistName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            playlistSongNum,
            style: TextStyle(
              color: kLightBlue,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
