import 'package:first_challenge/constents.dart';
import 'package:first_challenge/screens/login_screen.dart';
import 'package:first_challenge/screens/register_screen.dart';
import 'package:first_challenge/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(

              children: [
                Image.asset('assets/images/1.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            IconlyLight.arrow_left,
                            color: Colors.white,
                          )),
                  const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'welcome',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 370.0),
                  child: Container(

                    height: 360,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xffF4F5F9),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        )),

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(height: 10,),
                          const Text(
                              'Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy',style: TextStyle(color:  Color(0xFF868889),fontSize: 16),),
                          const Spacer(flex: 2,),
                          buttonComponent(
                              text: 'Continue with google',
                              onPressed: () {},
                              color: Colors.white,
                              icon: 'assets/images/google.svg',
                              textColor: Colors.black),
                          const SizedBox(height: 10,),

                          buttonComponent(
                            text: 'Create an account',
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Register()));
                            },
                            textColor: Colors.white,
                            icon: 'assets/images/Vector.svg',
                            color: KPrimaryColor,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style:
                                  TextStyle(color: Colors.grey[800], fontSize: 12),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));

                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[800]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 1,),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
