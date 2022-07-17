import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ringtone_set/ringtone_set.dart';
import 'package:youtube/components/data.dart';
import 'package:youtube/neu_box.dart';
import 'package:http/http.dart' as http;

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool shuffle = false;
  IconData likedBtn = Icons.favorite_border_rounded,
      playBtn = Icons.play_circle_fill_rounded;
  Color likedClr = Colors.black, shuffleClr = Colors.black;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();

  MyData data = MyData();

  //for api
  var url = 'https://spotify23.p.rapidapi.com/tracks/';
  var data1;
  //function for api
  fetchData() async {
    var res = await http.get(Uri.parse(url));
    data1 = jsonDecode(res.body);
    setState(() {});
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      // value: position1,
      onChanged: (value) {
        setState(() {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
      },
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    fetchData(); //fetching data from Api
    print(data.songName[MyData.current]);

    //
    MyData.playing
        ? audioPlayer.play(UrlSource(data.songs[MyData.current]))
        : null;
    audioPlayer.onPositionChanged.listen(
      (Duration p) {
        setState(() => position = p);
      },
    );

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => duration = d);
    });
    audioPlayer.onPlayerComplete.listen((event) async {
      if (MyData.current < data.songs.length - 1) {
        MyData.current++;
      } else {
        MyData.current = 0;
      }

      print(data.songName[MyData.current]);
      await audioPlayer.play(UrlSource(data.songs[MyData.current]));
    });
    print(MyData.liked[MyData.current]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          audioPlayer.stop();
                        },
                        child: const SizedBox(
                          height: 65,
                          width: 65,
                          child: Box(
                              child: Icon(Icons.arrow_back_ios_new_rounded)),
                        ),
                      ),
                      Text(
                        "M A D E  W I T H  L O V E",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/second');
                        },
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: Box(
                              child: PopupMenuButton(
                                  padding: const EdgeInsets.all(0),
                                  position: PopupMenuPosition.under,
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: const Text("Set as Ringtone"),
                                          onTap: () async {
                                            try {
                                              var res = await RingtoneSet
                                                  .setRingtoneFromNetwork(data
                                                      .songs[MyData.current]);
                                              // var res = true;
                                              print("Ringtone set : $res");
                                              if (res) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              13),
                                                      height: 90,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.greenAccent,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text(
                                                            "Done",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                letterSpacing:
                                                                    1,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            "Ringtone is Successfully Set",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    1,
                                                                color: Colors
                                                                    .black),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    elevation: 0,
                                                  ),
                                                );
                                              }
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text(e.toString())));
                                            }
                                          },
                                        )
                                      ])),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Box(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 270,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              data.images[MyData.current],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // GestureDetector(
                            //     onTap: () {
                            //       if (!shuffle) {
                            //         shuffle = true;
                            //         shuffleClr = Colors.green;
                            //         setState(() {});
                            //       } else {
                            //         shuffle = false;
                            //         shuffleClr = Colors.black;
                            //         setState(() {});
                            //       }
                            //     },
                            //     child: Icon(
                            //       Icons.shuffle_rounded,
                            //       color: shuffleClr,
                            //     )),
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.downloading_rounded)),
                            Column(
                              children: [
                                Text(
                                  data.songName[MyData.current],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.artist[MyData.current],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 14,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            // const LikeButton(
                            //   size: 28,
                            // ),
                            GestureDetector(
                              onTap: () {
                                if (!MyData.liked[MyData.current]) {
                                  MyData.liked[MyData.current] = true;
                                  // likedBtn = Icons.favorite_rounded;
                                  // likedClr = Colors.redAccent;
                                  setState(() {});
                                } else {
                                  MyData.liked[MyData.current] = false;

                                  // likedBtn = Icons.favorite_border_rounded;
                                  // likedClr = Colors.black;
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                MyData.liked[MyData.current]
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                size: 28,
                                color: MyData.liked[MyData.current]
                                    ? Colors.redAccent
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Box(
                    child: slider(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        position.toString().substring(2, 7),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      Text(
                        duration.toString().substring(2, 7),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              if (MyData.current > 0) {
                                MyData.current--;
                              } else {
                                MyData.current = data.songs.length - 1;
                              }
                              audioPlayer
                                  .play(UrlSource(data.songs[MyData.current]));
                              MyData.playing = true;
                            });
                          },
                          child: const Box(
                              child: Icon(
                            Icons.skip_previous_rounded,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Box(
                            child: GestureDetector(
                          onTap: () async {
                            if (MyData.playing) {
                              audioPlayer.pause();

                              setState(() {
                                MyData.playing = false;
                                // playBtn = Icons.play_circle_fill_rounded;
                              });
                            } else {
                              try {
                                // audioPlayer.play(UrlSource(assetsSong[0]));
                                audioPlayer.play(
                                    UrlSource(data.songs[MyData.current]));
                                setState(() {
                                  MyData.playing = true;
                                  // playBtn = Icons.pause_circle_filled_rounded;
                                });
                                // audioPlayer.play(UrlSource(songs[1]));
                              } catch (e) {
                                print(e);
                              }
                            }
                            setState(() {});
                          },
                          child: Icon(
                            MyData.playing
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_filled_rounded,
                            size: 35,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (MyData.current < data.songs.length - 1) {
                                MyData.current++;
                              } else {
                                MyData.current = 0;
                              }
                              audioPlayer
                                  .play(UrlSource(data.songs[MyData.current]));
                              MyData.playing = true;
                            });
                          },
                          child: const Box(
                              child: Icon(
                            Icons.skip_next_rounded,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
