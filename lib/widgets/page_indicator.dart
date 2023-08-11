import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Indicator extends StatelessWidget {
  Indicator({super.key, required this.controller});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 4,
      effect: const WormEffect(
        dotColor: Colors.white,
        activeDotColor: Colors.green,
        spacing: 10,
        dotHeight: 7,
        dotWidth: 7,
      ),
      onDotClicked: (index) => controller.jumpToPage(index),
    );
  }
}
