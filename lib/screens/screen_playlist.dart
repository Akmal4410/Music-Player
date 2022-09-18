import 'package:flutter/material.dart';

class ScreenPlaylist extends StatelessWidget {
  const ScreenPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'PLAYLIST',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
