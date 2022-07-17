import 'package:flutter/material.dart';

class AddSong extends StatefulWidget {
  const AddSong({Key? key}) : super(key: key);

  @override
  State<AddSong> createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter Song Name Here",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter Song Name Here",
            ),
          ),
        ],
      ),
    );
  }
}
