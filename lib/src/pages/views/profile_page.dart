import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

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

          ],
        ),
      ),
    );
  }
}
