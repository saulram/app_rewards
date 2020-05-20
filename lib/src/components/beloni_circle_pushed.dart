import 'package:flutter/material.dart';

class BeloniCircleContainerPushed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
        BoxShadow(
            color: Color(0xff707070),
            offset: Offset(-9, -3),
            blurRadius: 2,
            spreadRadius: -2),
        BoxShadow(
            color: Colors.white,
            offset: Offset(3, 6),
            blurRadius: 2,
            spreadRadius: -2)
      ], color: Colors.transparent),
      
    );
  }
}
