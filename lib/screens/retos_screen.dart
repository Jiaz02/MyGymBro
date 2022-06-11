import 'package:flutter/material.dart';
import 'package:my_gym_bro/theme/app_theme.dart';

class RetosScreen extends StatelessWidget {
  const RetosScreen({Key? key}) : super(key: key);

//pantalla de retos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryDarkBlue,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppTheme.primaryBlue,
            title: const Text('My Gym Bro'),
            centerTitle: true,
          ),
        ),
        body: const Center(
            child: Text('Proximamente',
                style: TextStyle(color: Colors.white, fontSize: 20))));
  }
}
