import 'package:apprewards/src/services/main_navigation_service.dart';
import 'package:apprewards/src/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class NavItem extends StatelessWidget {
  final Icon icono;
  final int position;

  const NavItem({Key key, this.icono, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navbarService = Provider.of<MainNavigationService>(context);
    List bridge = navbarService.factorList;
    return Expanded(
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.height *
            navbarService.factorList[this.position],
        height: MediaQuery.of(context).size.height *
            navbarService.factorList[this.position],
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 100),
        child: NeumorphicButton(
          provideHapticFeedback: true,
          onClick: () {
            List prof = navbarService.depthenabled;
            for (int i = 0; i < bridge.length; i++) {
              if (i == position) {
                prof[i] = false;
                bridge[i] = 0.08;
              } else {
                prof[i] = true;
                bridge[i] = 0.05;
              }
              navbarService.depthenabled = prof;
              navbarService.nuevaPagina = position;
            }

            navbarService.factorListUpdate = bridge;
          },
          boxShape: NeumorphicBoxShape.circle(),
          style: NeumorphicStyle(
              color: whiteBg,
              lightSource: LightSource.topLeft,
              disableDepth: navbarService.depthenabled[position],
              shape: NeumorphicShape.flat,
              depth: 5),
          child: icono,
        ),
      ),
    );
  }
}

class NavBarBottom extends StatelessWidget {
  final List<NavItem> items;

  const NavBarBottom({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * .01,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .15,
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .07,
                  child: Neumorphic(
                    boxShape: NeumorphicBoxShape.stadium(),
                    style: NeumorphicStyle(
                      lightSource: LightSource.top,
                      color: whiteBg,
                      shape: NeumorphicShape.flat,
                      depth: 1,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .02),
                child: Row(
                    children: items.length != 0
                        ? items.map<Widget>((item) {
                            return item;
                          }).toList()
                        : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
