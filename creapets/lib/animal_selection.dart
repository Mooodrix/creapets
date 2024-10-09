import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimalSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisis ton Animal'), // Utilisation de const ici
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
                        const Text(
                          'Sélectionne un animal à personnaliser',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20.0),
                        Flutter3DViewer.obj(
                          src: 'assets/dog.obj', // Chemin de l'objet 3D du chien
                          scale: 5,
                          cameraX: 0,
                          cameraY: 0,
                          cameraZ: 5,
                          onProgress: (double progressValue) {
                            debugPrint('model loading progress : $progressValue');
                          },
                          onLoad: (String modelAddress) {
                            debugPrint('model loaded : $modelAddress');
                          },
                          onError: (String error) {
                            debugPrint('model failed to load : $error');
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Animal sélectionné : Chien");
                            // Ici, tu peux ajouter une logique pour passer à la page de personnalisation
                          },
                          child: const Text('Chien'), // Utilisation de const ici
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
                        Flutter3DViewer.obj(
                          src: 'assets/cat.obj', // Chemin de l'objet 3D du chat
                          scale: 5,
                          cameraX: 0,
                          cameraY: 0,
                          cameraZ: 5,
                          onProgress: (double progressValue) {
                            debugPrint('model loading progress : $progressValue');
                          },
                          onLoad: (String modelAddress) {
                            debugPrint('model loaded : $modelAddress');
                          },
                          onError: (String error) {
                            debugPrint('model failed to load : $error');
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Animal sélectionné : Chat");
                            // Ici, tu peux ajouter une logique pour passer à la page de personnalisation
                          },
                          child: const Text('Chat'), // Utilisation de const ici
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
