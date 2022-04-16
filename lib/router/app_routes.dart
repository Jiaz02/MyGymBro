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
