import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class CustomPlayList extends StatelessWidget {
  const CustomPlayList({
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
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 14),
          // width: 120,
          width: screenWidth * 0.35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              playlistImage,
              fit: BoxFit.cover,
              // height: 137,
              height: screenHeight * 0.21,
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                style: const TextStyle(
                  color: kLightBlue,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
