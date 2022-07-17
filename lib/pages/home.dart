import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:youtube/components/data.dart';
import 'package:youtube/neu_box.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyData data = MyData();

  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 500,
              width: 350,
              child: Box(
                  child: ListView.builder(
                      itemCount: data.songs.length,
                      itemBuilder: ((BuildContext context, int index) {
                        return Box(
                          shadow: false,
                          child: ListTile(
                            title: Text(data.songName[index]),
                            leading: SizedBox(
                              width: 80,
                              child: Image.network(
                                data.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            subtitle: Text(data.artist[index]),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  MyData.liked[index] = !MyData.liked[index];
                                });
                              },
                              child: MyData.liked[index]
                                  ? const Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.redAccent,
                                    )
                                  : const Icon(Icons.favorite_border_rounded),
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
                      }))),
            )));
  }
}
