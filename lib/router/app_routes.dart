import 'package:flutter/material.dart';

import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'splash';

//pantallas disponibles
  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'peso',
        image: const AssetImage('assets/crearpr.png'),
        icon: Icons.tab,
        name: 'Pesos Screen',
        screen: const AddPrScreen()),
    MenuOption(
        route: 'graffic',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Grafico Screen',
        screen: const GrafficsScreen()),
    MenuOption(
        route: 'measure',
        image: const AssetImage('assets/medidas.png'),
        icon: Icons.tab,
        name: 'Medidas Screen',
        screen: const MeasureScreen()),
    MenuOption(
        route: 'splash',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.smart_display_sharp,
        name: 'Splash Screen',
        screen: const SplashScreen()),
    MenuOption(
        route: 'reto',
        image: const AssetImage('assets/retos.png'),
        icon: Icons.smart_display_sharp,
        name: 'Entrenos Screen',
        screen: const RetosScreen()),
  ];

  static final bottomMenuOption = <MenuOption>[
    MenuOption(
        route: 'friends',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Amigos Screen',
        screen: const AmigosScreen()),
    MenuOption(
        route: 'entrenos',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Entrenos Screen',
        screen: const EntrenosScreen()),
    MenuOption(
        route: 'home',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Home Screen',
        screen: const InicioScreen()),
    MenuOption(
        route: 'ejercicios',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Ejercicios Screen',
        screen: EjerciciosScreen()),
    MenuOption(
        route: 'user',
        image: const AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'User Screen',
        screen: const UserScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
