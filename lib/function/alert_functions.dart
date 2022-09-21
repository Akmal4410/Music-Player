import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/search_widget.dart';

showPlaylistModalSheet(BuildContext context, double screenHeight) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: kDarkBlue,
            borderRadius: BorderRadius.circular(30),
          ),
          height: screenHeight * 0.55,
          child: Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  showAddingPlaylistDialoge(ctx);
                },
                icon: const Icon(
                  Icons.playlist_add,
                  color: kDarkBlue,
                ),
                label: const Text(
                  'Create Playlist',
                  style: TextStyle(color: kDarkBlue),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: kLightBlue,
                  shape: const StadiumBorder(),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBlue,
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(),
                        title: Text('My Playlist'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

showAddingPlaylistDialoge(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kLightBlue,
            ),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Playlist',
                  style: TextStyle(
                      color: kDarkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SearchField(
                  hintText: 'Playlist Name',
                  icon: Icons.playlist_add,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: kDarkBlue, fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'OK',
                        style: TextStyle(color: kDarkBlue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
