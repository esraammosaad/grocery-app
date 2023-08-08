import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:first_challenge/screens/profilescreen.dart';
import 'package:first_challenge/screens/shoopingcartscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

import 'favoritesscreen.dart';
import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [HomePage(), const ProfileScreen(), const FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShoopingCart()));
        },
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          'assets/images/floatingbutton.svg',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          IconlyLight.home,
          IconlyLight.profile,
          Icons.favorite_border,
        ],
        activeColor: Colors.black,

        inactiveColor: const Color(0xff868889),

        activeIndex: selectedIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.sharpEdge,

        onTap: (index) => setState(() => selectedIndex = index),
        //other params
      ),
    );
  }
}
