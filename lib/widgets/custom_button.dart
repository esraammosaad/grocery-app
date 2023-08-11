import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class buttonComponent extends StatelessWidget {
  buttonComponent(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
       this.icon,
      required this.textColor});
  String text;
  VoidCallback onPressed;
  Color color;
  Color textColor;
  String ? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.4),
                color.withOpacity(0.5),
                color.withOpacity(0.9),
                color
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
             icon==null? const SizedBox(width: 0,): SvgPicture.asset(icon!),
              const Spacer(
                flex: 2,
              ),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
