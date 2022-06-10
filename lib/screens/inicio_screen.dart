import 'package:flutter/material.dart';
import 'package:my_gym_bro/screens/retos_screen.dart';

import '../widgets/widgets.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

//primera pantalla que se muestra en el home
class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //widget deslizante superior
        const CardSwiper(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //duplicar esto para añadir mas tarjetas donde los retos
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 9, bottom: 26),
              child: GestureDetector(
                  child: SizedBox(
                      width: 175,
                      height: size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage('assets/retos.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RetosScreen()))),
            ),
          ],
        )
      ],
    );
  }
}
