import 'package:flutter/material.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

//pantalla de splash, carga la app y revisamos si el usuario esta logueado
  @override
  Widget build(BuildContext context) {
    Widget splash = SplashScreenView(
      navigateRoute: CheckAuthScreen(),
      duration: 5000,
      speed: 150,
      imageSize: 150,
      imageSrc: "assets/logo.png",
      text: "My GymBro",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        AppTheme.primaryOrange,
        AppTheme.primaryDarkBlue,
        AppTheme.primaryOrange,
        AppTheme.primaryDarkBlue,
      ],
      backgroundColor: AppTheme.primaryBlue,
    );

    return MaterialApp(
      title: 'My Gym Bro',
      home: splash,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
