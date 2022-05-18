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
  var numseries = 0;

  List<DropdownMenuItem<String>> get dropdownMusculosItems {
    List<DropdownMenuItem<String>> menuMusculosItems = [
      DropdownMenuItem(child: Text(""), value: ""),
      DropdownMenuItem(child: Text("Pecho"), value: "Pecho"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
      DropdownMenuItem(child: Text("Pito"), value: "Pito"),
    ];
    return menuMusculosItems;
  }
  List<DropdownMenuItem<String>> get dropdownEjerciciosItems {
    List<DropdownMenuItem<String>> menuEjerciciosItems = [
      DropdownMenuItem(child: Text(""), value: ""),
      DropdownMenuItem(child: Text("Pecho"), value: "Pecho"),
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
      body: Form(
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
                numseries = int.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Num Series',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: RowRepeKg(),
          )
        ],
      )),
    );
  }
}
