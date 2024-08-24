import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final leerService = Provider.of<LeerJsonService>(context, listen: false);
    final rutinaService = Provider.of<RutinaService>(context);

    final controller = Get.find<Listas>();

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            FutureBuilder(
              future: authService.readToken(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) return const Text('');
                //cargamos el login o el home segun si hay datos de estar loggeado o no
                if (snapshot.data == '') {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => LoginScreen(),
                            transitionDuration: const Duration(seconds: 0)));
                  });
                } else {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HomeScreen(),
                            transitionDuration: const Duration(seconds: 0)));
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
                      controller.ejerciciosList =
                          snapshot.data?.ejercicio ?? [];
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
