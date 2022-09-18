import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            const SettingListTile(
              labeltext: 'About me',
              icon: Icons.person,
            ),
            const SettingListTile(
              labeltext: 'Share',
              icon: Icons.share,
            ),
            SettingListTile(
              labeltext: 'Notifications',
              icon: Icons.notifications,
              trailingWidget: Switch(
                  value: true,
                  onChanged: (value) {
                    true;
                  }),
            ),
            const SettingListTile(
              labeltext: 'Privacy Policy',
              icon: Icons.security,
            ),
            const SettingListTile(
              labeltext: 'License',
              icon: Icons.warning,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            '1.0.0',
            style: TextStyle(
              color: kLightBlue,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

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
        size: 25,
      ),
      title: Text(
        labeltext,
        style: const TextStyle(
          fontSize: 20,
          //fontWeight: FontWeight.w600,
        ),
      ),
      trailing: (trailingWidget == null) ? const SizedBox() : trailingWidget,
    );
  }
}
