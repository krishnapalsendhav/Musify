import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youtube/pages/addsongs.dart';
import 'package:youtube/pages/home.dart';
import 'package:youtube/pages/like.dart';
import 'package:youtube/pages/profile.dart';
import 'package:youtube/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> navPage = [
    const Home(),
    const Search(),
    const Favorite(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPage[selectedIndex],
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.all(16),
              activeColor: Colors.lightBlueAccent,
              onTabChange: (index) {
                selectedIndex = index;
                print(index);
                setState(() {});
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.search_rounded,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.favorite_border_rounded,
                  text: "Like",
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                  text: "Profile",
                ),
               
              ]),
        ),
      ),
    );
  }
}
