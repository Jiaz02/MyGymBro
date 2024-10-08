import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';
import '../theme/app_theme.dart';

class DetallesRutina extends StatefulWidget {
  DetallesRutina({Key? key, required this.rutina}) : super(key: key);

  Rutina rutina;

  @override
  State<DetallesRutina> createState() => _DetallesRutinaState();
}

class _DetallesRutinaState extends State<DetallesRutina> {
  final controller = Get.find<Listas>();

  @override
  Widget build(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.rutina.name,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            //mostramos los ejercicios de la rutina
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.rutina.listEjerciciosRutina?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 135, 255),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.white)),
                      child:
                          Text(widget.rutina.listEjerciciosRutina![index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarEjercicioRutinaScreen(
                            ejercicio:
                                widget.rutina.listEjerciciosRutina![index],
                            rutina: widget.rutina,
                            rutinaService: rutinaService,
                          ),
                        ),
                      );
                      setState(() {});
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Observaciones: ' + widget.rutina.note,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEntrenosScreen(
                      rutina: widget.rutina,
                      rutinaService: rutinaService,
                    ),
                  ),
                ).then((_) => setState(() {}));
                //con .then((_) => setState(() {}));  podemos refrescar la pagina actual
                //cuando volvamos de la pagina pusheada
                //https://stackoverflow.com/questions/49804891/force-flutter-navigator-to-reload-state-when-popping

              },
              child: const Text('Añadir Ejercicio'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: AppTheme.primaryBlue,
                  fixedSize: Size(MediaQuery.of(context).size.width, 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () async {
                controller.rutinasList.remove(widget.rutina);
                //TODO: elimina la rutina pero no reprintea la lista
                await rutinaService.deleteRutina(widget.rutina);
                Navigator.pop(context);
              },
              child: const Text('Eliminar Rutina'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                  fixedSize: Size(MediaQuery.of(context).size.width, 16)),
            ),
          )
        ],
      ),
    );
  }
}
