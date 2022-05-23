import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class AddEntrenosScreen extends StatefulWidget {
  const AddEntrenosScreen({Key? key}) : super(key: key);

  @override
  State<AddEntrenosScreen> createState() => _AddEntrenosScreenState();
}

class _AddEntrenosScreenState extends State<AddEntrenosScreen> {
  var numseries = 1;

  List<DropdownMenuItem<String>> get dropdownMusculosItems {
    List<DropdownMenuItem<String>> menuMusculosItems = [
      DropdownMenuItem(child: Text("Selecciona un grupo muscular"), value: ""),
      DropdownMenuItem(child: Text("Pectoral"), value: "Pectoral"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
      DropdownMenuItem(child: Text("Pito"), value: "Pito"),
    ];
    return menuMusculosItems;
  }

  List<DropdownMenuItem<String>> get dropdownEjerciciosItems {
    List<DropdownMenuItem<String>> menuEjerciciosItems = [
      DropdownMenuItem(child: Text("Selecciona el Ejercicio"), value: ""),
      DropdownMenuItem(child: Text("Pectoral"), value: "Pectoral"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
    ];
    return menuEjerciciosItems;
  }

  var grupoMuscular = "";
  var grupoEjercicios = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My GymBro'),
        backgroundColor: AppTheme.primaryBlue,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.primaryDarkBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  style: TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  value: grupoMuscular,
                  items: dropdownMusculosItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      grupoMuscular = newValue!;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  style: TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  value: grupoEjercicios,
                  items: dropdownEjerciciosItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      grupoEjercicios = newValue!;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    numseries = 0;
                    setState(() {});
                  } else {
                    numseries = int.parse(value);
                    if (numseries > 15) {
                    } else {
                      setState(() {});
                    }
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Num Series',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            ListView.builder(
              itemCount: numseries,
              shrinkWrap: true,
              primary: false,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                return RowRepeKg();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {},
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Observaciones',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {},
                child: Text('Añadir ejercicio'),
                // ignore: prefer_const_constructors
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    primary: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
