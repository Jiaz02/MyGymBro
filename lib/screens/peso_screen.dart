import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class PesoScreen extends StatefulWidget {
  PesoScreen({Key? key}) : super(key: key);

  @override
  State<PesoScreen> createState() => _PesoScreenState();
}

class _PesoScreenState extends State<PesoScreen> {
  List<DropdownMenuItem<String>> get dropdownEjercicioItems {
    List<DropdownMenuItem<String>> menuEjercicioItems = [
      DropdownMenuItem(child: Text("Selecciona un grupo muscular"), value: ""),
      DropdownMenuItem(child: Text("Pectoral"), value: "Pectoral"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
      DropdownMenuItem(child: Text("Pito"), value: "Pito"),
    ];
    return menuEjercicioItems;
  }

  var grupoEjercicios = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My GymBro'),
          centerTitle: true,
        ),
        backgroundColor: AppTheme.primaryDarkBlue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField(
                  style: TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  value: grupoEjercicios,
                  items: dropdownEjercicioItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      grupoEjercicios = newValue!;
                    });
                  }),
            ],
          ),
        ));
  }
}
