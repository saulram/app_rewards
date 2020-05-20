import 'package:apprewards/src/components/beloni_circle_pushed.dart';
import 'package:apprewards/src/components/beloni_neucard.dart';
import 'package:apprewards/src/components/beloni_neucircle.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/theme/theme.dart';
import 'package:apprewards/src/utils/globals.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  final int listLenght;

  const TransactionList({Key key, this.listLenght}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionService = Provider.of<TransactionService>(context);
    return /**
            * Sección de transacciones
            */
        transactionService.userTransactions.length == 0
            ? Container()
            : Container(
                color: whiteBg,
                child: RefreshIndicator(
                  color: Colors.grey[800],

                  onRefresh: transactionService.refreshTransactions,
                  backgroundColor: whiteBg,
                  child: ListView.builder(
                    itemCount: listLenght,
                    itemBuilder: (BuildContext context, index) {
                      var backwards =
                          transactionService.userTransactions.length -
                              1 -
                              index;
                      var dateFormat = DateFormat.yMd();

                      return Container(
                        margin: EdgeInsets.all(8),
                        child: BeloniCard(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .05,
                                vertical:
                                    MediaQuery.of(context).size.height * .02),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: BeloniCircleContainer(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              .1,
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              .005),
                                      child: CircleAvatar(
                                        backgroundColor: whiteBg,
                                        backgroundImage: NetworkImage(
                                            '$url_api/get-place-image/${transactionService.userTransactions[backwards].stablishments.image}'),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        AutoSizeText(
                                          '${transactionService.userTransactions[backwards].stablishments.name}',
                                          maxFontSize: 14,
                                          minFontSize: 5,
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xff3A3A3A),
                                              fontSize: 17),
                                        ),
                                        Container(
                                          child: Text(
                                            '${dateFormat.format(transactionService.userTransactions[backwards].date)}',
                                            style: GoogleFonts.poppins(
                                                color: Color(0xffABB6DD)),
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: Neumorphic(
                                    boxShape: NeumorphicBoxShape.circle(),
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            .03),
                                    style: NeumorphicStyle(
                                        color: whiteBg,
                                        depth: -2,
                                        intensity: 1,
                                        surfaceIntensity: 1),
                                    child: transactionService
                                                .userTransactions[backwards]
                                                .totalPoints >
                                            0
                                        ? Center(
                                            child: Icon(
                                            FontAwesomeIcons.arrowUp,
                                            color: Colors.green[900],
                                          ))
                                        : Icon(FontAwesomeIcons.arrowDown,color: Colors.red[900],),
                                  )),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              );
  }
}
