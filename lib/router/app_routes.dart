import 'package:flutter/material.dart';

import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'splash';

//pantallas disponibles
  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'graffic',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Grafico Screen',
        screen: const GrafficsScreen()),
    MenuOption(
        route: 'measure',
        image: AssetImage('assets/medidas.png'),
        icon: Icons.tab,
        name: 'Medidas Screen',
        screen: const MeasureScreen()),
    MenuOption(
        route: 'peso',
        image: AssetImage('assets/pesos.png'),
        icon: Icons.tab,
        name: 'Pesos Screen',
        screen: const PesoScreen()),
    MenuOption(
        route: 'splash',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.smart_display_sharp,
        name: 'Splash Screen',
        screen: const SplashScreen()),
    MenuOption(
        route: 'reto',
        image: AssetImage('assets/add_entreno.png'),
        icon: Icons.smart_display_sharp,
        name: 'Retos Screen',
        screen: const AddEntrenosScreen()),
    MenuOption(
        route: 'entreno',
        image: AssetImage('assets/retos.png'),
        icon: Icons.smart_display_sharp,
        name: 'Entrenos Screen',
        screen: const RetosScreen()),
  ];

  static final bottomMenuOption = <MenuOption>[
    MenuOption(
        route: 'friends',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Amigos Screen',
        screen: const AmigosScreen()),
    MenuOption(
        route: 'entrenos',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Entrenos Screen',
        screen: const EntrenosScreen()),
    MenuOption(
        route: 'home',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Home Screen',
        screen: const InicioScreen()),
    MenuOption(
        route: 'ejercicios',
        image: AssetImage('assets/graficos.png'),
        icon: Icons.tab,
        name: 'Ejercicios Screen',
        screen: const EjerciciosScreen()),
    MenuOption(
        route: 'user',
        image: AssetImage('assets/graficos.png'),
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
