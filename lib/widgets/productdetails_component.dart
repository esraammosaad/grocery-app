import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/productmodel.dart';


class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.index, required this.items})
      : super(key: key);
  int index;
  List<ProductModel> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      width: 310,
      child: Card(
        child: GridTile(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                items[index].status == null
                    ? Container()
                    : Container(
                        alignment: Alignment.topLeft,
                        width: 38,
                        height: 18,
                        color: items[index].status!.contains('%')
                            ? const Color(0xffFEE4E4)
                            : const Color(0xffFDEFD5),
                        child: Center(
                          child: Text(
                            items[index].status ?? '',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                color: items[index].status!.contains('%')
                                    ? const Color(0xffF56262)
                                    : const Color(0xffE8AD41),
                                fontSize: 10),
                          ),
                        )),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 20,
                      color: Color(0xff868889),
                    ),
                    alignment: AlignmentDirectional.topEnd),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: items[index].backGroundColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 3),
                      child: Image.asset(
                        items[index].image,
                        height: 68,
                        width: 68,
                      ),
                    ),
                  ],
                ),
                Text(
                  r'$' '${items[index].price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff6CC51D)),
                ),
                Text(
                  items[index].productName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  ' ${items[index].weight}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF868889)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/bag.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Add to cart',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
