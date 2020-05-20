import 'dart:ui';

import 'package:flutter/material.dart';

class BeloniCard extends StatelessWidget {
  final Widget child;
  final double width, height;
  final EdgeInsetsGeometry padding;

  const BeloniCard({Key key, this.child, this.width, this.height, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffeaebf3),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff989898),
                  offset: Offset(3, 6),
                  blurRadius: 1,
                  )
            ],
          ),
          child: Padding(
            padding: padding!=null ? padding : EdgeInsets.all(1),
            child: child,
          ),
        ),
      ),
    );
  }
}

