// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/mini_player.dart';
import 'package:music_player/widgets/search_widget.dart';

showMiniPlayer({
  required BuildContext context,
  required int index,
  required List<Songs> songList,
  required AssetsAudioPlayer audioPlayer,
}) {
  return showBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return MiniPlayer(
          songList: songList,
          index: index,
          audioPlayer: audioPlayer,
        );
      });
}

showPlaylistModalSheet({
  required BuildContext context,
  required double screenHeight,
  required int songIndex,
}) {
  Box<List> playlistBox = getPlaylistBox();
  Box<Songs> songBox = getSongBox();
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
                child: ListView.builder(
                  itemCount: playlistBox.length,
                  itemBuilder: (ctx, index) {
                    final keys = playlistBox.keys.toList();
                    final String playlistName = keys[index];
///////////////////////////////////////////////////////////////////////////////////////////

                    List<Songs> songList =
                        playlistBox.get(playlistName)!.cast<Songs>();
                    Songs song = songBox.values.toList()[songIndex];
                    songList.add(song);

///////////////////////////////////////////////////////////////////////////////////////////
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: kBlue,
                      ),
                      child: ListTile(
                        onTap: () async {
                          await playlistBox.put(playlistName, songList);
                          log('Added succesfully to the playlist');
                          Navigator.pop(context);
                        },
                        leading: const Text(
                          '🎧',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(playlistName),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      });
}

showAddingPlaylistDialoge(BuildContext context) {
  TextEditingController textEditingController = TextEditingController();
  final playlistBox = getPlaylistBox();

  Future<void> createNewplaylist() async {
    List<Songs> songList = [];
    final String playlistName = textEditingController.text;
    if (playlistName.isEmpty) {
      return;
    }
    await playlistBox.put(playlistName, songList);
  }

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
                const Text(
                  'Create Playlist',
                  style: TextStyle(
                      color: kDarkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SearchField(
                  textController: textEditingController,
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
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: kDarkBlue, fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await createNewplaylist();
                        Navigator.pop(ctx);
                      },
                      child: const Text(
                        'Create',
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

showPlaylistDeleteAlert({required BuildContext context, required String key}) {
  final playlistBox = getPlaylistBox();
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: kLightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Confirm Deletion',
            style: TextStyle(color: kDarkBlue),
          ),
          content: const Text(
            'Do you want to delete this Playlist',
            style: TextStyle(color: kDarkBlue),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: kDarkBlue,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await playlistBox.delete(key);
                Navigator.pop(ctx);
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: kDarkBlue,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      });
}
