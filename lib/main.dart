import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/service/service.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  //creamos la clase listas para que este disponible de forma global
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  Get.put(Listas());
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //hacemos que los servicios esten disponibles de forma global con el multiprovider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => LeerJsonService()),
        ChangeNotifierProvider(create: (_) => RutinaService()),
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
