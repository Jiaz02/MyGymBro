import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';

class RowRepeKg extends StatelessWidget {
  const RowRepeKg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

//creamos un containes para introducir las tarjetas de opciones
    return Row(
      children: const [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),
          child: Text('Num Repes',style: TextStyle(color: Colors.white))
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),
          child: TextField(
            //textInputAction: _showTextFields(),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Num',hintStyle: TextStyle (color: Colors.white)),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),
          child: Text('Volumen de Carga',style: TextStyle(color: Colors.white))
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Kg', hintStyle: TextStyle (color: Colors.white)),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0,top:8.0,bottom: 8.0),
          child: Text('Kg',style: TextStyle(color: Colors.white))
        )),
      ],
    );
  }
}