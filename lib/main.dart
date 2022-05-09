import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';

import 'theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //llamamos a la primera pantalla
        initialRoute: AppRoutes.initialRoute,
        //creamos las rutas, nombre que le queremos poner y luego el nombre de la clase
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //personalizamos el theme
        theme: AppTheme.lightTheme);
  }
}
