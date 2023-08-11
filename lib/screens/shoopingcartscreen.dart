import 'package:flutter/material.dart';

import '../constents.dart';
class ShoopingCart extends StatelessWidget {
  const ShoopingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: const Text('Shooping Cart'),
        centerTitle: true,



      ),
    );
  }
}
