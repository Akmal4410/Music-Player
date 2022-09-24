import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/custom_icon_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenNowPlaying extends StatefulWidget {
  ScreenNowPlaying({
    super.key,
    required this.songList,
    required this.index,
  });

  final List<SongModel> songList;
  final int index;

  @override
  State<ScreenNowPlaying> createState() => _ScreenNowPlayingState();
}

class _ScreenNowPlayingState extends State<ScreenNowPlaying> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<Audio> songAudio = [];

  void convertSongModel() {
    for (var song in widget.songList) {
      songAudio.add(
        Audio.file(
          widget.songList[widget.index].uri!,
          metas: Metas(
            title: widget.songList[widget.index].displayNameWOExt,
            artist: widget.songList[widget.index].artist,
            //   image: MetasImage.file(widget.songList[widget.index].),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    convertSongModel();
    audioPlayer.open(
        Playlist(
          audios: songAudio,
          startIndex: widget.index,
        ),
        autoStart: true,
        showNotification: true,
        loopMode: LoopMode.playlist
        //loopMode: songAudio.LoopMode.playlist,
        );

    super.initState();
  }

  bool isPlaying = true;

  void playButtonPressed() {
    if (isPlaying == true) {
      setState(() {
        isPlaying = false;
      });
    } else if (isPlaying == false) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            audioPlayer.stop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://images.unsplash.com/photo-1619961602105-16fa2a5465c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.cover,
                height: screenHeight * 0.4,
                width: double.infinity,
              ),
            ),
            SizedBox(height: screenHeight * 0.07),
            Text(
              widget.songList[widget.index].displayNameWOExt,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.songList[widget.index].artist!,
              style: const TextStyle(color: kLightBlue, fontSize: 13),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icons.playlist_add,
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    icon: Icons.shuffle,
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    icon: Icons.repeat,
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    icon: Icons.favorite_outline,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            audioPlayer.builderRealtimePlayingInfos(builder: (context, info) {
              final _duration = info.current!.audio.duration;
              final _position = info.currentPosition;
              return ProgressBar(
                progress: _position,
                total: _duration,
                progressBarColor: kBlue,
                baseBarColor: kDarkBlue,
                thumbColor: kBlue,
                bufferedBarColor: Colors.white.withOpacity(0.24),
                barHeight: 7.0,
                thumbRadius: 9.0,
                onSeek: (duration) {
                  audioPlayer.seek(duration);
                },
                timeLabelPadding: 10,
                timeLabelTextStyle: TextStyle(
                  color: kLightBlue,
                  fontSize: 15,
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.skip_previous,
                  onPressed: () async {
                    await audioPlayer.previous(
                      keepLoopMode: false,
                    );
                  },
                ),
                CustomIconButton(
                  icon: Icons.replay_10,
                  onPressed: () {
                    audioPlayer.seekBy(
                      Duration(seconds: -10),
                    );
                  },
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kLightBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        (isPlaying == true) ? Icons.pause : Icons.play_arrow,
                        color: kDarkBlue,
                        size: 32,
                      ),
                      onPressed: () {
                        playButtonPressed();
                        audioPlayer.playOrPause();
                      },
                    ),
                  ),
                ),
                CustomIconButton(
                  icon: Icons.forward_10,
                  onPressed: () {
                    audioPlayer.seekBy(
                      Duration(seconds: 10),
                    );
                  },
                ),
                CustomIconButton(
                  icon: Icons.skip_next,
                  onPressed: () async {
                    await audioPlayer.next(
                      keepLoopMode: false,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.09),
          ],
        ),
      ),
    );
  }
}
