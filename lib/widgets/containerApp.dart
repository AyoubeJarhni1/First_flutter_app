import 'package:flutter/material.dart';

class Containerapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Je suis très heureux !\n"
                      "Cette application vous permet de rechercher des utilisateurs GitHub "
                      "et d'afficher leurs profils en quelques clics.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),

                SizedBox(height: 10), // Espacement

                // Première image
                Image.asset(
                  'web/icons/logo.png',
                  height: 100, // Taille de l'image
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 10), // Espacement entre les images

                // Deuxième image
                Image.asset(
                  'web/icons/logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
