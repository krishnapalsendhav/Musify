import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youtube/pages/home.dart';
import 'package:youtube/pages/like.dart';
import 'package:youtube/pages/profile.dart';
import 'package:youtube/pages/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> navPage = [
    const Home(),
    const Search(),
    const Favorite(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SizedBox(
                width: 60,
              ),
              Text(
                "Name of the Song",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Icon(Icons.play_arrow_rounded),
              Icon(Icons.favorite_border_rounded),
            ],
          ),
        ),
        Container(
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
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
