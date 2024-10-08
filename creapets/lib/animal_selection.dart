import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimalSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisis ton Animal'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: AnimationLimiter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: const Duration(milliseconds: 500),
                  child: FadeInAnimation(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sélectionne un animal à personnaliser',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 200,
                          width: 200,
                          child: Flutter3DViewer.obj(
                            src: 'assets/dog.obj', // Chemin de l'objet 3D du chien
                            scale: 5, // Échelle de l'objet
                            cameraX: 0,
                            cameraY: 0,
                            cameraZ: 10,
                            onProgress: (double progressValue) {
                              debugPrint('Chien - Progression de chargement : $progressValue');
                            },
                            onLoad: (String modelAddress) {
                              debugPrint('Chien - Modèle chargé : $modelAddress');
                            },
                            onError: (String error) {
                              debugPrint('Chien - Échec du chargement : $error');
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Animal sélectionné : Chien");
                            // Ici, tu peux ajouter une logique pour passer à la page de personnalisation
                          },
                          child: Text('Chien'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(milliseconds: 500),
                  child: FadeInAnimation(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Flutter3DViewer.obj(
                            src: 'assets/cat.obj', // Chemin de l'objet 3D du chat
                            scale: 5, // Échelle de l'objet
                            cameraX: 0,
                            cameraY: 0,
                            cameraZ: 10,
                            onProgress: (double progressValue) {
                              debugPrint('Chat - Progression de chargement : $progressValue');
                            },
                            onLoad: (String modelAddress) {
                              debugPrint('Chat - Modèle chargé : $modelAddress');
                            },
                            onError: (String error) {
                              debugPrint('Chat - Échec du chargement : $error');
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Animal sélectionné : Chat");
                            // Ici, tu peux ajouter une logique pour passer à la page de personnalisation
                          },
                          child: Text('Chat'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
