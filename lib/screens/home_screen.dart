import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Gym Bro'),
          centerTitle: true,
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            items: const <Widget>[
              Icon(Icons.people_sharp, size: 30),
              Icon(Icons.list_alt_rounded, size: 30),
              Icon(Icons.dashboard, size: 30),
              Icon(Icons.power, size: 30),
              Icon(Icons.person, size: 30),
            ],
            onTap: (index) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AppRoutes.bottomMenuOption[index].screen))),
        body: Column(
          children: [
            CardSwiper(),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 9),
              child: GestureDetector(
                  child: Container(
                      width: 175,
                      height: size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const FadeInImage(
                          placeholder: AssetImage('assets/no-image.jpg'),
                          image: AssetImage('assets/add_entreno.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppRoutes.menuOption[5].screen))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 9),
              child: GestureDetector(
                  child: Container(
                      width: 175,
                      height: size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const FadeInImage(
                          placeholder: AssetImage('assets/no-image.jpg'),
                          image: AssetImage('assets/retos.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppRoutes.menuOption[4].screen))),
            )
          ],
        ));
  }
}
