import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class ScreenNowPlaying extends StatefulWidget {
  ScreenNowPlaying({
    super.key,
    required this.songeName,
    required this.songArtist,
  });
  final String songeName;
  final String songArtist;

  @override
  State<ScreenNowPlaying> createState() => _ScreenNowPlayingState();
}

class _ScreenNowPlayingState extends State<ScreenNowPlaying> {
  bool? isPlaying;
  @override
  void initState() {
    isPlaying = true;
    super.initState();
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
            Navigator.pop(
              context,
              [isPlaying, widget.songeName, widget.songArtist],
            );
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
                //height: 320,
                height: screenHeight * 0.4,
                width: double.infinity,
              ),
            ),
            SizedBox(height: screenHeight * 0.07),
            Text(
              widget.songeName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.songArtist,
              style: const TextStyle(color: kLightBlue, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomiconButton(
                    icon: Icons.playlist_add,
                    onPressed: () {},
                  ),
                  CustomiconButton(
                    icon: Icons.shuffle,
                    onPressed: () {},
                  ),
                  CustomiconButton(
                    icon: Icons.repeat,
                    onPressed: () {},
                  ),
                  CustomiconButton(
                    icon: Icons.favorite_outline,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            ProgressBar(
              progress: const Duration(seconds: 345),
              buffered: const Duration(),
              total: const Duration(seconds: 1760),
              progressBarColor: kBlue,
              baseBarColor: kDarkBlue,
              thumbColor: kBlue,
              bufferedBarColor: Colors.white.withOpacity(0.24),
              barHeight: 7.0,
              thumbRadius: 9.0,
              onSeek: (duration) {},
              timeLabelPadding: 10,
              timeLabelTextStyle: TextStyle(color: kLightBlue, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomiconButton(
                  icon: Icons.skip_previous,
                  onPressed: () {},
                ),
                CustomiconButton(
                  icon: Icons.replay_10,
                  onPressed: () {},
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kLightBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        color: kDarkBlue,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                CustomiconButton(
                  icon: Icons.forward_10,
                  onPressed: () {},
                ),
                CustomiconButton(
                  icon: Icons.skip_next,
                  onPressed: () {},
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

class CustomiconButton extends StatelessWidget {
  const CustomiconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: kLightBlue,
        size: 30,
      ),
    );
  }
}
