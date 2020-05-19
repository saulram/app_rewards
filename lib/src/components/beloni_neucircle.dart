import 'dart:ui';

import 'package:flutter/material.dart';

class BeloniCircleContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;

  const BeloniCircleContainer({Key key, this.radius, this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(radius, radius)),
        color: Color(0xffeaebf3),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(152, 152, 152, 1),
              offset: Offset(3, 6),
              blurRadius: 6,
              spreadRadius: 2)
        ],
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
        child: child,
      ),
    );
  }
}
