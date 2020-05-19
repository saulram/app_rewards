import 'package:apprewards/src/components/beloni_neucard.dart';
import 'package:apprewards/src/components/beloni_neucircle.dart';
import 'package:apprewards/src/components/transaction_list.dart';
import 'package:apprewards/src/models/user_model.dart';
import 'package:apprewards/src/pages/transactions/transactions_full.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:apprewards/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionService = Provider.of<TransactionService>(context);
    final userService = Provider.of<UserService>(context);
    /**
     * Seccion avatar image
     */
    Widget avatar = Center(
      child: Hero(
        tag: 'avatar',
        child: BeloniCircleContainer(
          padding: EdgeInsets.all(8),
          radius: MediaQuery.of(context).size.width * .4,
          child: CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width * .2,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(
              userService.user.user.profilePic != null ? 'https://rewards.disolutionsmx.com/api/get-user-image/${userService.user.user.profilePic}':'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/86811916/original/5d2499b138522f3486159269b72ca2c7d5ea86f1/illustrate-an-amazing-flat-avatar-for-you.jpg'),
          ),
        ),
      ),
    );
    /**
     * Sección total de puntos
     */
    Widget totalPoints = Hero(
      tag: 'total',
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
                                  fontSize: 10, color: Color(0xff565454)),
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
    );
    /**
     * Seccion Movimientos y ver más
     */
    Widget listoOptions = Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text('Mis Movimientos'),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                /**
                 * Implementar navegacion al listado de todas las transacciones
                 */
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TransactionsFull()));
              },
              child: Text('Ver más'),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Bienvenido ${userService.user.user.name}',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.timesCircle,
              color: Colors.black,
            ),
            onPressed: () async {
              userService.user = User();
              userService.user.token = '';
              userService.deleteAllUserData();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(flex: 2, child: avatar),
            Expanded(flex: 1, child: totalPoints),
            Expanded(flex: 1, child: listoOptions),
            Expanded(
                flex: 4,
                child: TransactionList(
                  listLenght: 10,
                )),
          ],
        ),
      ),
    );
  }
}
