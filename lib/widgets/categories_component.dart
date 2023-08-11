import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/categories_model.dart';

class Categories extends StatelessWidget {
  Categories({Key? key, required this.index, required this.categories})
      : super(key: key);
  int index;
  List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: categories[index].backGroundColor,
            child: SvgPicture.asset(
              categories[index].image,
              width: 23,
              height: 23,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            categories[index].category,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF868889),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}