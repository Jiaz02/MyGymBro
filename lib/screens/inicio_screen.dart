import 'package:flutter/material.dart';

import '../router/app_routes.dart';
import '../widgets/widgets.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  var numseries = 0;
  List<Widget> ListaRowRepeKg = [];

  _showTextFields() async {
    for (var i = 1; i < numseries; i++) {

      ListaRowRepeKg.add(RowRepeKg());

      //return ListaRowRepeKg;
    }
  }

  _introEntreno() async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Introduce un ejercicio"),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), hintText: 'Ejercicio'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) { 
                    numseries = int.parse(value);
                    _showTextFields();
                    },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: 'Num Series'),
                ),
              ),
              //Mostramos tantas filas como series hayamos puesto arriba
              RowRepeKg(),
            ],
          );
        });
    return alertDialogs;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CardSwiper(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 9, bottom: 26),
              child: GestureDetector(
                  child: Container(
                      width: 175,
                      height: size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage('assets/add_entreno.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  onTap: () => _introEntreno()),

              /*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppRoutes.menuOption[5].screen))
                              */
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 9, bottom: 26),
              child: GestureDetector(
                  child: Container(
                      width: 175,
                      height: size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage('assets/retos.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppRoutes.menuOption[4].screen))),
            ),
          ],
        )
      ],
    );
  }
}

class RowRepeKg extends StatelessWidget {
  const RowRepeKg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            //textInputAction: _showTextFields(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Num Repes'),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Kg'),
          ),
        )),
      ],
    );
  }
}
