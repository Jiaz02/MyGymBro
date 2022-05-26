import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/service/service.dart';
import 'package:my_gym_bro/service/peticiones_service.dart';
import 'package:provider/provider.dart';

import 'theme/app_theme.dart';

void main() => {runApp(AppState())};

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        //ChangeNotifierProvider(create: ( _ )=> Listas())
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: NotificationsService.messengerKey,
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
