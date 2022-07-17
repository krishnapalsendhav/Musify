import 'package:flutter/material.dart';
import 'package:youtube/components/data.dart';
import 'package:youtube/neu_box.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  MyData data = MyData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Favourite",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: data.songs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2 , childAspectRatio: 1.5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: GestureDetector(
                        child: Box(
                          child: Text(
                            data.songName[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            MyData.current = index;
                            // audioPlayer.play(
                            //     UrlSource(data.songs[MyData.current]));
                            MyData.playing = true;
                            Navigator.pushNamed(context, '/song');
                            //for duration
                          });
                        },
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
