import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';

class ScreenNowPlaying extends StatelessWidget {
  const ScreenNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Image.network(
              'https://images.unsplash.com/photo-1619961602105-16fa2a5465c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.cover,
              height: 320,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              child: Text(
                "Harry Styles - As It Was",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            const Text(
              'Harry Styles',
              style: TextStyle(color: kLightBlue, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.playlist_add,
                    color: kLightBlue,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: kLightBlue,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat,
                    color: kLightBlue,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: kLightBlue,
                    size: 30,
                  ),
                ),
              ],
            ),
            Slider(
              value: 0.6,
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3:10',
                  style: TextStyle(color: kLightBlue, fontSize: 15),
                ),
                Text(
                  '3:50',
                  style: TextStyle(color: kLightBlue, fontSize: 15),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
