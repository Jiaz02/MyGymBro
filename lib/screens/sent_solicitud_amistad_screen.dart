import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/listas.dart';
import 'package:my_gym_bro/service/peticiones_service.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../models/models.dart';
import '../service/service.dart';
import '../theme/app_theme.dart';
import '../widgets/amigos_card.dart';
import '../widgets/solicitud_amigos_card.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class SentSolicitudAmistadScreen extends StatefulWidget {
  const SentSolicitudAmistadScreen({Key? key}) : super(key: key);

  @override
  State<SentSolicitudAmistadScreen> createState() => _SentSolicitudAmistadScreenState();
}

class _SentSolicitudAmistadScreenState extends State<SentSolicitudAmistadScreen> {
  final controller = Get.find<Listas>();

  String nombreUsuario = '';

  @override
  Widget build(BuildContext context) {
    loadSol(context);
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Widget wid;
            if (controller.solicitudesAmistadList.isEmpty) {
           wid = const Center(
              child: Text('No hay peticiones pendientes',
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        } else {
          //mostramos los amigos disponibles con las tarjetas
          wid = Expanded(
            child: ListView.builder(
              itemCount: controller.solicitudesAmistadList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: SolicitudAmigosCard(controller.solicitudesAmistadList[index]),
                  onTap: () async {
                    print(controller.solicitudesAmistadList[index]);
                    
                  },
                );
              }),
          );
        }
            return Column(

            children: [

               Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pop(context);},
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () async {},
                        icon: const Icon(Icons.mail),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                ),
               ),
              const Divider(),
              wid
        
            ],
          );
            //si no hay rutinas mostramos un mensaje
      }, future: null,),
      //boton añadir rutinas
    );
  }

//cuadro de dialogo para crear nuevas rutinas
  void loadSol(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
    rutinaService.getSolicitudAmistad();
    }
}
