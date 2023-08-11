import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_challenge/screens/login_screen.dart';
import 'package:first_challenge/screens/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constents.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(color: KPrimaryColor),
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/2.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
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
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300.0),
                      child: Container(
                        height: 450,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffF4F5F9),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Create account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Quickly create account ',
                                style: TextStyle(
                                  color: Color(0xFF868889),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              reusableTextField(
                                  controller: emailController,
                                  text: 'Email address',
                                  isPassword: false,
                                  icon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  onFeildSubmitted: (value) {}),
                              const SizedBox(
                                height: 10,
                              ),
                              reusableTextField(
                                isPassword: false,
                                text: 'Phone number',
                                controller: phoneController,
                                onFeildSubmitted: (value) {},
                                keyboardType: TextInputType.phone,
                                icon: const Icon(IconlyLight.call,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              reusableTextField(
                                  controller: passwordController,
                                  isPassword: isPassword,
                                  text: 'Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  icon: const Icon(IconlyLight.lock,color: Colors.grey,),
                                  iconButton: IconButton(
                                      onPressed: () {

                                        isPassword = !isPassword;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        isPassword
                                            ? IconlyLight.hide
                                            : IconlyLight.show,
                                        color: Colors.grey,
                                      )),
                                  onFeildSubmitted: (value) {}),
                              const SizedBox(
                                height: 20,
                              ),
                              buttonComponent(
                                text: 'Sign Up',
                                onPressed: ()async {

                                  if (formKey.currentState!.validate()) {
                                    try {
                                      isLoading = true;
                                      setState(() {});
                                      await registerUser();
                                      showSnackBar(context, 'user created');
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBarScreen()));
                                    } on FirebaseAuthException catch (e) {
                                      showSnackBar(context, e.code.toString());
                                    }
                                    isLoading = false;
                                    setState(() {});
                                  }
                                },
                                textColor: Colors.white,
                                color: KPrimaryColor,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(
                                          color: Colors.grey[800], fontSize: 12),
                                    ),
                                    TextButton(
                                      onPressed: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

  }
}
