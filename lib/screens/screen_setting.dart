import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

import 'package:music_player/widgets/setting_list_tile.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
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
          Column(
            children: const [
              Padding(
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
          ),
        ],
      ),
    );
  }
}
