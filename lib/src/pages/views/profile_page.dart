import 'package:apprewards/src/components/beloni_neucard.dart';
import 'package:apprewards/src/components/beloni_neucircle.dart';
import 'package:apprewards/src/services/coupons_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:apprewards/src/theme/theme.dart';
import 'package:apprewards/src/utils/globals.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final couponService = Provider.of<CouponService>(context);

    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Mis Recompensas',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 900,
                child: couponService.loadingCp == true
                    ? Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ))
                    : LiquidPullToRefresh(
                        color: Color(0xff333333),
                        onRefresh: () async {
                          couponService.getUserCoupons();
                        },
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: couponService.cuponlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FlipCard(
                                front: BeloniCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      BeloniCircleContainer(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        child: CircleAvatar(
                                          backgroundColor: whiteBg,
                                          backgroundImage: NetworkImage(
                                              '$url_api/get-place-image/${couponService.cuponlist[index].stablishments.image}'),
                                        ),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                .02),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '${couponService.cuponlist[index].stablishments.name}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          r'$' +
                                              '${couponService.cuponlist[index].amount}MXN',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.chevronDown,
                                        color: Color(0xff333333),
                                      )
                                    ],
                                  ),
                                ),
                                back: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Neumorphic(
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(20)),
                                      style: NeumorphicStyle(
                                          depth: -6,
                                          color: whiteBg,
                                          lightSource: LightSource.topLeft,
                                          surfaceIntensity: 1,
                                          intensity: 1),
                                      child: Column(
                                        children: <Widget>[
                                          QrImage(
                                            data: couponService
                                                .cuponlist[index].code,
                                            size: 130,
                                            version: QrVersions.auto,
                                          ),
                                          Container(
                                            child: Text(
                                                'Codigo: ${couponService.cuponlist[index].code}',style: GoogleFonts.poppins(),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
