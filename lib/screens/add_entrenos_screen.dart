
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

import '../models/models.dart';
import '../service/service.dart';

class AddEntrenosScreen extends StatefulWidget {
  AddEntrenosScreen(
      {Key? key, required this.rutina, required this.rutinaService})
      : super(key: key);

  Rutina rutina;
  final RutinaService rutinaService;

  @override
  State<AddEntrenosScreen> createState() => _AddEntrenosScreenState();
}

class _AddEntrenosScreenState extends State<AddEntrenosScreen> {
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
      DropdownMenuItem(
          child: Text("Deltoides anterior"), value: "Deltoides anterior"),
      DropdownMenuItem(child: Text("Trapecio"), value: "Trapecio"),
      DropdownMenuItem(child: Text("Oblicuos"), value: "Oblicuos"),
      DropdownMenuItem(
          child: Text("Deltoides posterior"), value: "Deltoides posterior"),
      DropdownMenuItem(child: Text("Gemelos"), value: "Gemelos"),
      DropdownMenuItem(child: Text("Soleo"), value: "Soleo"),
    ];
    return menuMusculosItems;
  }

//creamos una lista donde guardaremos las listas
  late List<RowRepKg> list = [];
  //llamamos a la clase listas
  final controller = Get.find<Listas>();
  //rellenamos el combo box de los ejercicios
  List<DropdownMenuItem<EjercicioElement>> get dropdownEjerciciosItems {
    List<DropdownMenuItem<EjercicioElement>> menuEjerciciosItems = [];
    for (var item in controller.ejerciciosList) {
      if (item.muscle.contains(grupoMuscular)) {
        menuEjerciciosItems
            .add(DropdownMenuItem(child: Text(item.name), value: item));
      }
    }
    return menuEjerciciosItems;
  }

  var grupoMuscular = "";
  var numseries = 1;

  late EjercicioElement ejercicioElegido;
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
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  value: grupoMuscular,
                  items: dropdownMusculosItems,
                  onChanged: (String? newValue) {
                    //cuando cambie, cambiamos los ejercicios
                    setState(() {
                      grupoMuscular = newValue!;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  hint: const Text(
                    'Selecciona Ejercicios',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  items: dropdownEjerciciosItems,
                  onChanged: (EjercicioElement? newValue) {
                    setState(() {
                      //cuando cambia, actualizamos el ejercicio elegido
                      ejercicioElegido = EjercicioElement(
                          name: newValue?.name ?? '',
                          tip: newValue?.tip ?? '',
                          muscle: newValue?.muscle ?? [],
                          url: newValue?.url ?? '');
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  //en funcion del numero de series mostramos mas o menos rows
                  if (value.isEmpty) {
                    numseries = 0;
                    setState(() {});
                  } else {
                    numseries = int.parse(value);
                    if (numseries > 15) {
                      numseries = 15;
                      setState(() {});
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
            //listview para mostrar
            ListView.builder(
              itemCount: numseries,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, int index) {
                return RowRepeKg(list);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () async {
                  //guardamos la rutina
                  widget.rutina.listEjerciciosRutina?.add(EjercicioRutina(
                    name: ejercicioElegido.name,
                    tip: ejercicioElegido.tip,
                    muscle: ejercicioElegido.muscle,
                    url: ejercicioElegido.url,
                    listSeries: list,
                  ));
                  if (mounted) {
                    setState(() {});
                  }
                  await widget.rutinaService.saveOrCreateRutina(widget.rutina);
                  Navigator.pop(context);
                },
                child: const Text('Añadir ejercicio'),
                style: TextButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
