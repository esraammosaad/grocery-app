import 'package:first_challenge/constents.dart';
import 'package:first_challenge/screens/register_screen.dart';
import 'package:first_challenge/screens/welcome_screen.dart';
import 'package:first_challenge/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class FirstSplashScreen extends StatelessWidget {
  FirstSplashScreen(
      {Key? key,
      required this.image,
      required this.text,
      required this.controller,
      required this.selectedIndex})
      : super(key: key);
  PageController controller = PageController();
  String text;
  String image;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    controller.jumpToPage(selectedIndex - 1);
                  },
                  child: Text(
                    selectedIndex != 0 ? 'Back' : '',
                    style: const TextStyle(color: Color(0xFF797171)),
                  )),
              const Spacer(
                flex: 1,
              ),
              TextButton(
                  onPressed: () {
                    print(selectedIndex);
                    selectedIndex == 3
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen())):controller.jumpToPage(selectedIndex + 1)
                         ;
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: KPrimaryColor),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  selectedIndex == 0
                      ? Image.asset(
                          'assets/images/logo.png',
                          width: 95,
                          height: 35,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    ' Lorem ipsum dolor sit amet, consetetur ',
                    style: TextStyle(
                        color: Color(0xff868889), ),
                  ),
                  const Text('sadipscing elitr, sed diam nonumy',
                      style: TextStyle(color: Color(0xff868889))),
                  const Spacer(
                    flex: 5,
                  ),
                  Indicator(controller: controller),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
