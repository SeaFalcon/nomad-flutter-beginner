import 'dart:io';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  // final String text;
  // final Color bgColor;
  // final Color textColor;

  // const Header(
  //     {super.key,
  //     required this.text,
  //     required this.bgColor,
  //     this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage('assets/noImage.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "+",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
