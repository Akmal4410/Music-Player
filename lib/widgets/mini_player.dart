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

  void convertSongMode() {
    for (var song in widget.songList) {
      songAudio.add(
        Audio.file(
          song.uri!,
          metas: Metas(
            id: song.id.toString(),
            title: song.displayNameWOExt,
            artist: song.artist,
            image: widget.audioPlayer.getCurrentAudioImage,
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
                  // image: DecorationImage(
                  //   image: widget.audioPlayer.getCurrentAudioImage
                  //       as ImageProvider,
                  // ),
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
                    child: const Icon(
                      Icons.skip_previous,
                      color: kDarkBlue,
                      size: 33,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () async {
                      if (isPlaying == true) {
                        await widget.audioPlayer.pause();
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      } else if (isPlaying == false) {
                        await widget.audioPlayer.play();
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      }
                    },
                    child: Icon(
                      isPlaying == true ? Icons.pause : Icons.play_arrow,
                      color: kDarkBlue,
                      size: 33,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      widget.audioPlayer.next();
                    },
                    child: const Icon(
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
