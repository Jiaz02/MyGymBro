import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/listas.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../models/models.dart';
import '../service/service.dart';
import '../theme/app_theme.dart';
import '../widgets/amigos_card.dart';
import '../widgets/widgets.dart';
import 'screens.dart';
import 'sent_solicitud_amistad_screen.dart';

class AmigosScreen extends StatefulWidget {
  const AmigosScreen({Key? key}) : super(key: key);

  @override
  State<AmigosScreen> createState() => _EntrenosScreenState();
}

class _EntrenosScreenState extends State<AmigosScreen> {
  final controller = Get.find<Listas>();

  String nombreUsuario = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Widget wid;
            if (controller.amigosList.isEmpty) {
           wid = const Center(
              child: Text('Añade un amigo dandole al boton +',
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        } else {
          //mostramos los amigos disponibles con las tarjetas
          wid = Expanded(
            child: ListView.builder(
              itemCount: controller.amigosList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: AmigosCard(controller.amigosList[index]),
                  onTap: () async {
                    print(controller.amigosList[index]);
                    
                  },
                );
              }),
          );
        }
            return Column(

            children: [

               Padding(
                 padding: const EdgeInsets.only(top: 24.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () async {},
                        icon: Transform.rotate(angle: 225 * math.pi / 180,
                        child: const Icon(Icons.send_rounded)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () {
                          showCustomDialog(context);
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SentSolicitudAmistadScreen(),
                      ));
                        },
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
  void showCustomDialog(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              color: AppTheme.primaryBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                      child: Text('Escribe el nombre de usuario',
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (!value.isEmpty) {
                          nombreUsuario = value;
                        }
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Usuario',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextButton(
                        onPressed: () {
                          rutinaService.sendPeticionAmistad(nombreUsuario);
                          Navigator.pop(cxt);
                        },
                        child: const Text('Enviar solicitud'),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: AppTheme.primaryBlue,
                            fixedSize: Size(MediaQuery.of(cxt).size.width, 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
