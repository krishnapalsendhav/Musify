import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var res;
  var image;
  @override
  void initState() {
    try {
      res = SpotifySdk.connectToSpotifyRemote(
          clientId: "6531388de5e347a4a08344f513dc9477",
          redirectUrl: "com.example.youtube://callback");
      print("connection successfull");
      print(res);
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    SpotifySdk.getPlayerState();
                    var name = SpotifySdk.play(
                        spotifyUri: 'spotify:track:4iEGv5Ne6HuCkFCjzxdWQK');
                    print(SpotifySdk.subscribeConnectionStatus());
                    print("Name of song : $name");
                    print("Playlist play successfully");
                  } catch (e) {
                    print(res);
                    print(e);
                  }
                },
                child: Text("Click Me")),
            Container(
              height: 200,
              child: Image.network(
                  "https://images.unsplash.com/photo-1657480193827-cc66f35e974b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
            )
          ],
        ),
      ),
    );
  }
}
