import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constents.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import 'navbar_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(color: KPrimaryColor),

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
                      'assets/images/3.png',
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
                            'Login',
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
                        height: 350,
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
                                'Welcome back !',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Sign in to your account ',
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
                              const SizedBox(height: 5),
                              reusableTextField(
                                  controller: passwordController,
                                  isPassword: isPassword,
                                  text: 'Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  icon: const Icon(
                                    IconlyLight.lock,
                                    color: Colors.grey,
                                  ),
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
                                height: 10,
                              ),
                              buttonComponent(
                                text: 'Login',
                                onPressed: ()async {
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      isLoading = true;
                                      setState(() {});
                                      await registerUser();
                                      showSnackBar(context, 'Success');
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
                                      "Don't have an account",
                                      style: TextStyle(
                                          color: Colors.grey[800], fontSize: 12),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Sign Up',
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
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

  }
}
