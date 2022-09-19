import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_home.dart';
import 'package:music_player/screens/screen_playlist.dart';
import 'package:music_player/screens/screen_setting.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => ScreenNavigationState();
}

class ScreenNavigationState extends State<ScreenNavigation> {
  final _bottomNavBar = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.queue_music), label: 'Playlist'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final List<Widget> _screens = <Widget>[
    ScreenHome(),
    ScreenPlaylist(),
    ScreenSetting(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        elevation: 0,
        backgroundColor: const Color(0xFF1B262C),
        iconSize: 30,
        selectedItemColor: const Color(0xFFBBE1FA),
        unselectedItemColor: const Color(0xFF0F4C75),
        items: _bottomNavBar,
      ),
    );
  }
}
