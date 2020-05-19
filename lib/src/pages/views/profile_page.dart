import 'package:apprewards/src/services/coupons_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final couponService = Provider.of<CouponService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/loading.gif',
                      image:
                          'https://rewards.disolutionsmx.com/api/get-user-image/${userService.user.user.profilePic}'),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                      '${userService.user.user.name} ${userService.user.user.surname}'),
                )
              ],
            ),
            Text(userService.user.user.email),
            Text(
              'Mis Cupones',
              style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 30)),
            ),
            Container(
              height: 500,
              child: couponService.loadingCp == true
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () async{
                        couponService.getUserCoupons();
                      },
                      child: ListView.builder(
                          itemCount: couponService.cuponlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  'Codigo de cupon: ${couponService.cuponlist[index].code}',
                                  style: GoogleFonts.montserrat(),
                                ),
                                subtitle: Text(
                                    'Valido en: ${couponService.cuponlist[index].establishment}'),
                                trailing: Text(r'$' +
                                    '${couponService.cuponlist[index].amount.toString()}'),
                              ),
                            );
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
