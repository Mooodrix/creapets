import 'package:flutter/material.dart';
import 'animal_selection.dart'; // Ajoute de la nvl page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CréaPets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // cette ligne en bas specifie le text en haut à gauche (comme page web...)
        // title: Text('CréaPets - Accueil'),
        backgroundColor: Colors.blue, //changer la couleur de l'AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenue dans CréaPets!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Redirection vers la page de sélection de l'animal avec animation
                Navigator.push(
                  context,
                  _createRoute(),
                );
              },
              child: Text('Commencer'),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AnimalSelectionPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Départ de la droite
        const end = Offset.zero; // Fin à la position finale
        const curve = Curves.easeInOut;

        // Animation
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // Animation du passage du bouton à la nouvelle page
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}