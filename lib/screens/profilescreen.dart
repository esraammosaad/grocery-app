import 'package:flutter/material.dart';

import '../constents.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: const Text('Profile'),
        centerTitle: true,



      ),
    );
  }
}
