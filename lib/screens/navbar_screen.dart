import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:first_challenge/screens/profilescreen.dart';
import 'package:first_challenge/screens/shoopingcartscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

import '../constents.dart';
import 'favoritesscreen.dart';
import 'homescreen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeScreen(), const ProfileScreen(), const FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShoopingCart()));
        },
        backgroundColor: KPrimaryColor ,
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
