import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class EntrenosScreen extends StatelessWidget {
  const EntrenosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => EntrenoCard()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: AppTheme.primaryBlue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEntrenosScreen()));
          }),
    );
  }
}
