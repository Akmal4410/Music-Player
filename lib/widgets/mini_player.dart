import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({
    Key? key,
    required this.songList,
    required this.index,
    required this.audioPlayer,
  }) : super(key: key);

  final List<SongModel> songList;
  final int index;
  final AssetsAudioPlayer audioPlayer;

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  List<Audio> songAudio = [];
  bool isPlaying = true;

  void playorPauseButtonPressed() {}

  void convertSongMode() {
    for (var song in widget.songList) {
      songAudio.add(
        Audio.file(
          song.uri!,
          metas: Metas(
            title: song.displayNameWOExt,
            artist: song.artist,
          ),
        ),
      );
    }
  }

  Future<void> openAudioPLayer() async {
    convertSongMode();

    await widget.audioPlayer.open(
      Playlist(
        audios: songAudio,
        startIndex: widget.index,
      ),
      autoStart: true,
      showNotification: true,
      loopMode: LoopMode.playlist,
    );
  }

  @override
  void initState() {
    openAudioPLayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // height: 75,
        height: screenHeight * 0.075,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBlue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: widget.audioPlayer.builderRealtimePlayingInfos(
              builder: (context, realtimePlayingInfos) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) {
                    return ScreenNowPlaying(
                      songList: widget.songList,
                      index: widget.index,
                      audioPlayer: widget.audioPlayer,
                    );
                  }),
                );
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.music_note,
                  color: kDarkBlue,
                ),
              ),
              title: TextScroll(
                widget.audioPlayer.getCurrentAudioTitle,
                velocity: const Velocity(
                  pixelsPerSecond: Offset(50, 0),
                ),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.audioPlayer.previous();
                    },
                    child: Icon(
                      Icons.skip_previous,
                      color: kDarkBlue,
                      size: 33,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.play_arrow,
                    color: kDarkBlue,
                    size: 33,
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      widget.audioPlayer.next();
                    },
                    child: Icon(
                      Icons.skip_next,
                      color: kDarkBlue,
                      size: 33,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
