import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: kLightBlue,
            size: 25,
          ),
          hintText: 'Songs or Playlist..',
          hintStyle: const TextStyle(color: kLightBlue),
          filled: true,
          fillColor: const Color(0xFF153950),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, color: Color(0xFF153950)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
              color: kBlue,
            ),
          ),
        ),
      ),
    );
  }
}
