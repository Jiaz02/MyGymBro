
import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/rutina.dart';
import 'package:my_gym_bro/models/user.dart';
import 'package:my_gym_bro/theme/app_theme.dart';

import '../models/amigo.dart';
import '../screens/screens.dart';

class SolicitudAmigosCard extends StatelessWidget {
  const SolicitudAmigosCard(this.user, {Key? key}) : super(key: key);
  final SolicitudAmistad user;
  @override
  Widget build(BuildContext context) {
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
                Text(
                  user.para,
                  style: const TextStyle(color: Colors.white),
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
