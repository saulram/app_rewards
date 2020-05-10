import 'package:apprewards/src/models/user_model.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionService = Provider.of<TransactionService>(context);
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido${userService.user.user.name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              userService.user = User();
              userService.user.token = '';
              userService.deleteAllUserData();
            },
          ),
        ],
      ),
      body: Center(
        child: transactionService.loading == true
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Mis ultimas transacciones',
                        style: GoogleFonts.montserrat(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Container(
                      child: RefreshIndicator(
                        onRefresh: transactionService.refreshTransactions,
                        child: ListView.builder(

                          itemCount: transactionService.userTransactions.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              leading:
                              Icon(Icons.trip_origin,color: Colors.amberAccent,),
                              title: Text(
                                transactionService
                                    .userTransactions[index].establishment,
                                style: GoogleFonts.montserrat(),
                              ),
                              subtitle: Text(
                                'Total de Puntos: ${transactionService
                                    .userTransactions[index].totalPoints
                                    .toString()}',
                              ),
                              trailing: Icon(Icons.chevron_right),

                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
