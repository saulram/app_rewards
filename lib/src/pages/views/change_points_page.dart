import 'package:apprewards/src/services/coupons_service.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CashPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final transactionService = Provider.of<TransactionService>(context);
    final cuponService = Provider.of<CouponService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '${transactionService.totalPoints}',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Text('Canjear Puntos'),
            Slider(
              divisions: transactionService.totalPoints > 0
                  ? transactionService.totalPoints ~/ 100000
                  : 1,
              max: transactionService.totalPoints.toDouble(),
              min: 0,
              value: transactionService.pointsToChange,
              label: "${transactionService.pointsToChange.toInt()}",
              onChanged: (nuevoval) async {
                transactionService.pointsToChange = nuevoval;
              },
              onChangeEnd: (val) {
                transactionService.newTotal =
                    transactionService.totalPoints - val.toInt();
              },
            ),
            Text(
                'Estas canjeando : ${transactionService.pointsToChange.toInt()} puntos'),
            SizedBox(
              height: 20,
            ),
            Text(
                'Te quedan : ${transactionService.newTotal != null ? transactionService.newTotal : transactionService.totalPoints} puntos'),
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: FormBuilderDropdown(
                attribute: "url",
                decoration: InputDecoration(labelText: "Comercio"),
                // initialValue: 'Male',
                hint: Text('Selecciona el negocio'),
                validators: [
                  FormBuilderValidators.required(
                      errorText: 'Este campo debe estar completo')
                ],

                items: ['https://aprendly.com']
                    .map((gender) =>
                        DropdownMenuItem(value: gender, child: Text("$gender")))
                    .toList(),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                if (_fbKey.currentState.saveAndValidate()) {
                  cuponService.stablishment = _fbKey.currentState.value['url'];
                  bool cuponCreated = await cuponService
                      .createCupon(transactionService.pointsToChange.toInt());
                  if (cuponCreated == true) {
                    bool transcreated =
                        await transactionService.createTransactionCuponChanged(
                            cuponService.stablishment);
                    if (transcreated == true) {
                      Navigator.pop(context);
                    } else {
                      //error aqui
                    }
                  }
                }
              },
              color: Colors.redAccent,
              child: Text(
                'Generar mi descuento',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white)),
              ),
            ),
            cuponService.loadingCp == true
                ? CircularProgressIndicator()
                : Container()
          ],
        ),
      ),
    );
  }
}
