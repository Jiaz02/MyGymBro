import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../service/service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: () {
          authService.logout();
          Navigator.pushReplacement(context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => LoginScreen()));
        },
        child: Text('Cerrar Sesion'),
        style: TextButton.styleFrom(
            backgroundColor: AppTheme.primaryBlue,
            primary: Colors.white,
            fixedSize: Size(MediaQuery.of(context).size.width, 16)),
      ),
    );
  }
}
