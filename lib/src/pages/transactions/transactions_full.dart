import 'package:apprewards/src/components/beloni_appbar.dart';
import 'package:apprewards/src/components/beloni_neucard.dart';
import 'package:apprewards/src/components/beloni_neucircle.dart';
import 'package:apprewards/src/components/transaction_list.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionsFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionService = Provider.of<TransactionService>(context);

    return Scaffold(
      backgroundColor: whiteBg,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            BeloniAppBar(
              navigationIcon: Icon(FontAwesomeIcons.chevronLeft),
              title: 'Transacciones',
              action: Hero(
                tag: 'avatar',
                child: BeloniCircleContainer(
                  padding: EdgeInsets.all(2),
                  radius: MediaQuery.of(context).size.width * .15,
                  child: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width * .2,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                        'https://rewards.disolutionsmx.com/api/get-user-image/${transactionService.user.user.profilePic}'),
                  ),
                ),
              ),
              onclick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: BeloniCard(
                    child: transactionService.loading == true
                        ? Center(
                            child: NeumorphicProgressIndeterminate(),
                          )
                        : Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Puntos Disponibles',
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Color(0xff565454)),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${transactionService.formatedtotalPoints} Puntos',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0F3A53)),
                                    ),
                                    MediaQuery.of(context).size.height < 700
                                        ? Container()
                                        : Text('Vencimiento: 1 Enero, 2029')
                                  ],
                                ),
                              ],
                            ),
                          )),
              ),
            ),
            Container(

              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 30,left: 10),
              child: Text(
                'Mis Movimientos',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: TransactionList(
                  listLenght: transactionService.userTransactions.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
