import 'package:first_challenge/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:remove_background/crop_widget.dart';
class PageViewerScreen extends StatefulWidget {
   PageViewerScreen({Key? key}) : super(key: key);

  @override
  State<PageViewerScreen> createState() => _PageViewerScreenState();
}

class _PageViewerScreenState extends State<PageViewerScreen> {
   PageController pageController=PageController();

   int selectedScreen=0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController ,
      onPageChanged: (index){
        selectedScreen=index;

        setState(() {

        });


      },



      children: [

        FirstSplashScreen(image:'assets/images/one.png',text:'Welcome to', controller: pageController,selectedIndex: selectedScreen),
        FirstSplashScreen(image:'assets/images/two.png',text:'   Buy Quality\nDairy Products', controller: pageController,selectedIndex: selectedScreen),
        FirstSplashScreen(image:'assets/images/three.png',text:'Buy Premium\nQuality Fruits', controller: pageController,selectedIndex: selectedScreen),
        FirstSplashScreen(image:'assets/images/four.png',text:'Get Discounts On\n    All Products', controller: pageController,selectedIndex: selectedScreen),


      ],
    );
  }
}
