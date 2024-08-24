
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/rutina.dart';
import 'package:my_gym_bro/models/user.dart';
import 'package:my_gym_bro/service/peticiones_service.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../models/amigo.dart';
import '../models/listas.dart';
import '../screens/screens.dart';

class SolicitudAmigosCard extends StatefulWidget {
  final SolicitudAmistad user;
  final Function onRequestHandled;

  const SolicitudAmigosCard(this.user, {Key? key, required this.onRequestHandled}) : super(key: key);

  @override
  State<SolicitudAmigosCard> createState() => _SolicitudAmigosCardState();
}

class _SolicitudAmigosCardState extends State<SolicitudAmigosCard> {
  final controller = Get.find<Listas>();

  @override
  Widget build(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 200,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const _backgroundImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      widget.user.de,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      await rutinaService.respondPeticion(widget.user, 'rechazada');
                      widget.onRequestHandled(); // Notificar al padre
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      await rutinaService.respondPeticion(widget.user, 'aceptada');
                      widget.onRequestHandled(); // Notificar al padre
                    },
                    icon: const Icon(Icons.check),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}



class _backgroundImage extends StatelessWidget {
  const _backgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const SizedBox(
        width: double.infinity,
        height: 400,
        child: Image(
          image: AssetImage('assets/cbum.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SolicitudAmigosEnviadaCard extends StatefulWidget {
  final SolicitudAmistad user;
  final Function onRequestHandled;

  const SolicitudAmigosEnviadaCard(this.user, {Key? key, required this.onRequestHandled}) : super(key: key);

  @override
  State<SolicitudAmigosEnviadaCard> createState() => _SolicitudAmigosEnviadaCardState();
}

class _SolicitudAmigosEnviadaCardState extends State<SolicitudAmigosEnviadaCard> {
  final controller = Get.find<Listas>();

  @override
  Widget build(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 200,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const _backgroundImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      widget.user.de,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      await rutinaService.respondPeticion(widget.user, 'rechazada');
                      widget.onRequestHandled(); // Notificar al padre
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}