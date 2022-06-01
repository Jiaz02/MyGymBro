import 'package:flutter/material.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final leerService = Provider.of<LeerJsonService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: authService.readToken(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) return Text('');

                if (snapshot.data == '') {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => LoginScreen(),
                            transitionDuration: Duration(seconds: 0)));
                  });
                } else {
                  print('no lee del json');
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => HomeScreen(),
                            transitionDuration: Duration(seconds: 0)));
                  });
                }

                return Container(
                  color: AppTheme.primaryBlue,
                );
              },
            ),
            FutureBuilder<Ejercicio>(
                future: leerService.fetchEjercicio(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Future.microtask(() {
                      Listas().ejerciciosList =
                          snapshot.data?.ejercicio as List<EjercicioElement>;
                      print(Listas().ejerciciosList);
                    });
                  }

                  return Container(
                    color: AppTheme.primaryBlue,
                  );
                })
          ],
        ),
      ),
    );
  }
}
