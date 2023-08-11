import 'package:first_challenge/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
class PageViewComp extends StatelessWidget {
   PageViewComp({Key? key,required this.image, this.text,required this.pageController}) : super(key: key);
  String image;
  String ?text;
   PageController pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image,fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
        Padding(
          padding: const EdgeInsets.only(top: 120,left:20 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text( text??'' ,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),

              const SizedBox(
                height: 25,
              ),
              Indicator(controller: pageController),
            ],
          ),
        )
      ],
    );
  }
}
