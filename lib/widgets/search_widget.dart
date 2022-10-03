import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.textController,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final TextEditingController textController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        validator: validator,
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kLightBlue,
            size: 25,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: kLightBlue),
          filled: true,
          fillColor: const Color(0xFF153950),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, color: Color(0xFF153950)),
          ),
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

// 'Songs or Playlist..'