import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    Key? key,
    required this.labeltext,
    required this.icon,
    this.trailingWidget,
  }) : super(key: key);

  final String labeltext;
  final IconData icon;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: kLightBlue,
        size: 22.5,
      ),
      title: Text(
        labeltext,
        style: const TextStyle(
          fontSize: 18.5,
          //fontWeight: FontWeight.w600,
        ),
      ),
      trailing: (trailingWidget == null) ? const SizedBox() : trailingWidget,
    );
  }
}
