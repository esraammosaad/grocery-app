import 'package:flutter/material.dart';
class ShoopingCart extends StatelessWidget {
  const ShoopingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xff6CC51D),
        title: const Text('Shooping Cart'),
        centerTitle: true,



      ),
    );
  }
}
