import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/amigo.dart';
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

class SolicitudAmistadEnviadas extends StatefulWidget {
  const SolicitudAmistadEnviadas({Key? key}) : super(key: key);

  @override
  State<SolicitudAmistadEnviadas> createState() => _SolicitudAmistadEnviadasState();
}

class _SolicitudAmistadEnviadasState extends State<SolicitudAmistadEnviadas> {
  final controller = Get.find<Listas>();
  void _handleRequestHandled() {
    setState(() {
      // Elimina la solicitud de la lista
    });
  }

  String nombreUsuario = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Widget wid;
            if (controller.solicitudesAmistadListEnviadas.isEmpty) {
           wid = const Center(
              child: Text('Envia una peticion de amistad',
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        } else {
          //mostramos los amigos disponibles con las tarjetas
          wid = Expanded(
            child: ListView.builder(
              itemCount: controller.solicitudesAmistadListEnviadas.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: SolicitudAmigosCard(controller.solicitudesAmistadList[index],
                  onRequestHandled: () => _handleRequestHandled(),
                  ),
                  onTap: () async {
                    setState(() {
                      
                    });
                    
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
                          controller.solicitudesAmistadList.clear();
                          Navigator.pop(context);},
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Transform.rotate(
                        angle: 225 * math.pi / 180, // Convierte 210 grados a radianes
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                      )
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
  
}
