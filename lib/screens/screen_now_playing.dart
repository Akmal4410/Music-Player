import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/custom_icon_button.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';

class ScreenNowPlaying extends StatefulWidget {
  const ScreenNowPlaying({
    super.key,
    required this.songList,
    required this.index,
    required this.audioPlayer,
  });

  final List<Audio> songList;
  final int index;
  final AssetsAudioPlayer audioPlayer;

  @override
  State<ScreenNowPlaying> createState() => _ScreenNowPlayingState();
}

class _ScreenNowPlayingState extends State<ScreenNowPlaying> {
  bool isPlaying = true;
  bool isLoop = true;
  bool isShuffle = true;

  void playOrPauseButtonPressed() async {
    if (isPlaying == true) {
      await widget.audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else if (isPlaying == false) {
      await widget.audioPlayer.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  void shuffleButtonPressed() {
    setState(() {
      widget.audioPlayer.toggleShuffle();
      isShuffle = !isShuffle;
    });
  }

  void repeatButtonPressed() {
    if (isLoop == true) {
      widget.audioPlayer.setLoopMode(LoopMode.single);
    } else {
      widget.audioPlayer.setLoopMode(LoopMode.playlist);
    }
    setState(() {
      isLoop = !isLoop;
    });
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
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
      body: widget.audioPlayer.builderCurrent(builder: (context, playing) {
        final myAudio = find(widget.songList, playing.audio.assetAudioPath);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: QueryArtworkWidget(
                  artworkHeight: screenHeight * 0.4,
                  artworkWidth: double.infinity,
                  id: int.parse(myAudio.metas.id!),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: Image.asset(
                    'assets/images/nowPlaying.png',
                    fit: BoxFit.cover,
                    height: screenHeight * 0.4,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.75,
                  height: 30,
                  child: TextScroll(
                    widget.audioPlayer.getCurrentAudioTitle,
                    velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                    mode: TextScrollMode.bouncing,
                    numberOfReps: 2,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.audioPlayer.getCurrentAudioArtist == '<unknown>'
                      ? 'Unknown'
                      : widget.audioPlayer.getCurrentAudioArtist,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: kLightBlue, fontSize: 13),
                ),
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
                      icon: (isShuffle == true)
                          ? Icons.shuffle
                          : Icons.arrow_forward,
                      onPressed: () {
                        shuffleButtonPressed();
                      },
                    ),
                    CustomIconButton(
                      icon: (isLoop == true) ? Icons.repeat : Icons.repeat_one,
                      onPressed: () {
                        repeatButtonPressed();
                      },
                    ),
                    CustomIconButton(
                      icon: Icons.favorite_outline,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              widget.audioPlayer.builderRealtimePlayingInfos(
                  builder: (context, info) {
                final duration = info.current!.audio.duration;
                final position = info.currentPosition;

                return ProgressBar(
                  progress: position,
                  total: duration,
                  progressBarColor: kBlue,
                  baseBarColor: kDarkBlue,
                  thumbColor: kBlue,
                  bufferedBarColor: Colors.white.withOpacity(0.24),
                  barHeight: 7.0,
                  thumbRadius: 9.0,
                  onSeek: (duration) {
                    widget.audioPlayer.seek(duration);
                  },
                  timeLabelPadding: 10,
                  timeLabelTextStyle: const TextStyle(
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
                      await widget.audioPlayer.previous();
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.replay_10,
                    onPressed: () {
                      widget.audioPlayer.seekBy(
                        const Duration(seconds: -10),
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
                          playOrPauseButtonPressed();
                        },
                      ),
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.forward_10,
                    onPressed: () {
                      widget.audioPlayer.seekBy(
                        const Duration(seconds: 10),
                      );
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.skip_next,
                    onPressed: () async {
                      await widget.audioPlayer.next();
                    },
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.09),
            ],
          ),
        );
      }),
    );
  }
}
