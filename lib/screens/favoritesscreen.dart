import 'package:flutter/material.dart';

import '../constents.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: const Text('Favorites'),
        centerTitle: true,



      ),
    );
  }
}
