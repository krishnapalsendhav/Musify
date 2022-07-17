import 'package:flutter/material.dart';
import 'package:youtube/home_page.dart';
import 'package:youtube/song_app.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/song': (context) => const SongPage(),
        '/second': (context) => const MyApp()
      },
    );
  }
}
