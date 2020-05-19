import 'package:apprewards/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class BeloniAppBar extends StatelessWidget {
  final Icon navigationIcon;
  final Function onclick;

  final String title;
  final Widget action;

  const BeloniAppBar(
      {Key key, this.navigationIcon, this.onclick, this.title, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .02),
      color: whiteBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NeumorphicButton(
            child: Center(child: navigationIcon),
            onClick: onclick,
            boxShape: NeumorphicBoxShape.circle(),
            style: NeumorphicStyle(
                color: whiteBg,
                shape: NeumorphicShape.concave,
                depth: -2,
                intensity: 1,
                lightSource: LightSource.topRight),
          ),
          Container(
            child: Text(
              '$title',
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xff44637E)),
            ),
          ),
          ClipRect(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: action,
              ),
            ),
          )
        ],
      ),
    );
  }
}
