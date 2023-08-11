import 'package:first_challenge/widgets/categories_component.dart';
import 'package:first_challenge/widgets/page_indicator.dart';
import 'package:first_challenge/widgets/page_view_component.dart';
import 'package:first_challenge/widgets/productdetails_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

import '../models/categories_model.dart';
import '../models/productmodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  PageController controller = PageController();
  List<Category> categories = [
    Category(
      backGroundColor: const Color(0xffE6F2EA),
      image: 'assets/images/vegetables.svg',
      category: 'Vegetables',
    ),
    Category(
      backGroundColor: const Color(0xffFFE9E5),
      image: 'assets/images/fruits.svg',
      category: 'Fruits',
    ),
    Category(
      backGroundColor: const Color(0xffFFF6E3),
      image: 'assets/images/Beverages.svg',
      category: 'Beverages',
    ),
    Category(
      backGroundColor: const Color(0xffF3EFFA),
      image: 'assets/images/grocery.svg',
      category: 'Grocery',
    ),
    Category(
      backGroundColor: const Color(0xffDCF4F5),
      image: 'assets/images/edible_oil.svg',
      category: 'Edible oil',
    ),
    Category(
        backGroundColor: const Color(0xffFFE8F2),
        image: 'assets/images/vacuum.svg',
        category: 'Household'),
  ];
  List<ProductModel> items = [
    ProductModel(
        weight: 'dozen',
        productName: 'Fresh Peach',
        image: 'assets/images/peach.png',
        price: 8,
        backGroundColor: const Color(0xFFFFCEC1)),
    ProductModel(
        weight: '2lbs',
        productName: 'Avacoda',
        image: 'assets/images/aocado.png',
        price: 7,
        status: 'NEW',
        backGroundColor: const Color(0xFFFCFFD9)),
    ProductModel(
        weight: '1.5lbs',
        productName: 'Pineapple',
        image: 'assets/images/pineapple-pieces.png',
        price: 9.9,
        backGroundColor: const Color(0xFFFFE6C2)),
    ProductModel(
        weight: '5lbs',
        productName: 'Black Grapes',
        image: 'assets/images/grapes.png',
        price: 7.05,
        status: '-16%',
        backGroundColor: const Color(0xFFFEE1ED)),
    ProductModel(
        weight: '1.5lbs',
        productName: 'Pomegranate',
        image: 'assets/images/pomegranate.png',
        price: 2.09,
        status: 'NEW',
        backGroundColor: const Color(0xFFFFE3E2)),
    ProductModel(
        weight: '1Kg',
        productName: 'Fresh B roccoli',
        image: 'assets/images/broccoli.png',
        price: 3,
        backGroundColor: const Color(0xFFD2FFD0)),
  ];


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          title: Container(
            height: 50,
            color: const Color(0xFFF4F5F9),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                SvgPicture.asset('assets/images/search.svg',
                    height: 20, width: 20, semanticsLabel: 'search icon'),
                const Spacer(
                  flex: 1,
                ),
                const Text('Search Keywords..',
                    style: TextStyle(color: Color(0xFF868889), fontSize: 15)),
                const Spacer(
                  flex: 5,
                ),
                SvgPicture.asset('assets/images/setting_icon.svg',
                    height: 14, width: 14, semanticsLabel: 'setting icon'),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          expandedHeight: 300,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 220,
                      child: PageView(
                        controller: controller,
                        children: [
                          PageViewComp(
                            pageController:controller ,
                            image: 'assets/images/home.png',
                            text: '20% off on your\nfirst purchase',
                          ),
                          PageViewComp(
                            pageController: controller ,
                            image: 'assets/images/second.jpeg',
                            text: 'Always fresh\nsometimes normal',
                          ),
                          PageViewComp(
                            pageController:controller ,
                            image: 'assets/images/third.jpeg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(children: [
              const Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    IconlyLight.arrow_right_2,
                    color: Color(0xff868889),
                    size: 22,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Categories(
                          index: index,
                          categories: categories,
                        )),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Featured products',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      IconlyLight.arrow_right_2,
                      color: Color(0xff868889),
                      size: 22,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProductDetails(
                index: index,
                items: items,
              ),
            ),
            childCount: items.length,
          ),
        )
      ],
    );
  }
}
