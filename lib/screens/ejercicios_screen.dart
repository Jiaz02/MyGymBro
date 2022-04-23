import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class EjerciciosScreen extends StatelessWidget {
  const EjerciciosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My GymBro'),
          centerTitle: true,
        ),
        body: Text('textito de ejercicios'));
  }
}
