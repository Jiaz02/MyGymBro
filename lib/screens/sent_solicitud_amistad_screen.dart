import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/listas.dart';

import '../models/models.dart';
import '../theme/app_theme.dart';
import '../widgets/solicitud_amigos_card.dart';

class SentSolicitudAmistadScreen extends StatefulWidget {
  const SentSolicitudAmistadScreen({Key? key}) : super(key: key);

  @override
  State<SentSolicitudAmistadScreen> createState() => _SentSolicitudAmistadScreenState();
}

class _SentSolicitudAmistadScreenState extends State<SentSolicitudAmistadScreen> {
  final controller = Get.find<Listas>();

  String nombreUsuario = '';

  void _handleRequestHandled() {
    setState(() {
      // Elimina la solicitud de la lista
    });
  }

  @override
  Widget build(BuildContext context) {
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
              wid = Expanded(
                child: ListView.builder(
                  itemCount: controller.solicitudesAmistadList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: SolicitudAmigosCard(
                        controller.solicitudesAmistadList[index],
                        onRequestHandled: () => _handleRequestHandled(),
                      ),
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
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.mail,color: Colors.white,)
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                wid,
              ],
            );
          },
          future: null,
      ),
    );
  }
}