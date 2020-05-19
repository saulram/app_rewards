import 'dart:ui';

import 'package:apprewards/src/theme/theme.dart';
import 'package:flutter/material.dart';

class BeloniButton extends StatefulWidget {
  final Widget child;
  final double width, height, radius;

  const BeloniButton(
      {Key key, this.child, this.width, this.height, this.radius})
      : super(key: key);

  @override
  _BeloniButtonState createState() => _BeloniButtonState();
}

class _BeloniButtonState extends State<BeloniButton> {
  double dx, dy;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      dx = 3;
      dy = 6;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.all(widget.width * .02),
          decoration: BoxDecoration(
            color: whiteBg,
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: [
              BoxShadow(
                color: Color(0xff767676),
                offset: Offset(dx, dy),
                blurRadius: 6,
              ),
            ],
          ),
          duration: Duration(milliseconds: 10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff26c097),
                    Color(0xff0f4c81),
                  ],

                ),
              ),
              child: Center(child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}
