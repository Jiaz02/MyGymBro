import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/ejercicio_rutina.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class EditarEjercicioRutinaScreen extends StatefulWidget {
  EditarEjercicioRutinaScreen({Key? key, required this.ejercicio}) : super(key: key);

 EjercicioRutina ejercicio;

  @override
  State<EditarEjercicioRutinaScreen> createState() => _EditarEjercicioRutinaScreen();
}

class _EditarEjercicioRutinaScreen extends State<EditarEjercicioRutinaScreen> {
  late var numseries = widget.ejercicio.getNumRepes;


  List<DropdownMenuItem<String>> get dropdownMusculosItems {
    List<DropdownMenuItem<String>> menuMusculosItems = const [
      DropdownMenuItem(child: Text("Selecciona un grupo muscular"), value: ""),
      DropdownMenuItem(child: Text("Pectoral"), value: "Pectoral"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
      DropdownMenuItem(child: Text("Cuadriceps"), value: "Cuadriceps"),
      DropdownMenuItem(child: Text("Gluteos"), value: "Gluteos"),
      DropdownMenuItem(child: Text("Femoral"), value: "Femoral"),
      DropdownMenuItem(child: Text("Isquiosurales"), value: "Isquiosurales"),
      DropdownMenuItem(child: Text("Triceps"), value: "Triceps"),
      DropdownMenuItem(child: Text("Deltoides anterior"), value: "Deltoides anterior"),
      DropdownMenuItem(child: Text("Trapecio"), value: "Trapecio"),
      DropdownMenuItem(child: Text("Oblicuos"), value: "Oblicuos"),
      DropdownMenuItem(child: Text("Deltoides posterior"), value: "Deltoides posterior"),
      DropdownMenuItem(child: Text("Gemelos"), value: "Gemelos"),
      DropdownMenuItem(child: Text("Soleo"), value: "Soleo"),
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
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: numseries.toString(),
                    label: Text('Num Series'),
                    labelStyle: TextStyle(color: Colors.white),
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
