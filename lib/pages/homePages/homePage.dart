import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Home Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer:Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
        DrawerHeader(
        decoration: BoxDecoration(
        color: Colors.deepOrange,
        ),
        child: Text(
        'Menu',
        style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        ),
        ),
        ),
        ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {
        Navigator.pushNamed(context, '/');
        },
    ),
    ListTile(
    leading: Icon(Icons.account_circle),
    title: Text('Users Page'),
    onTap: () {
    Navigator.pushNamed(context, '/users');
    },
    ),
    ListTile(
    leading: Icon(Icons.settings),
    title: Text('Container App'),
    onTap: () {
    Navigator.pushNamed(context, '/cont');
    },
    ),
    ],
    ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16), // Espacement autour du contenu
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Coins arrondis
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              width: 300, // Largeur du container
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image de l'application
                  Image.asset(
                    'web/icons/logo.png',
                    height: 100, // Taille de l'image
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10), // Espacement entre l'image et le texte

                  // Texte d'introduction
                  Text(
                    "Bienvenue sur GitHub User Finder !\n"
                        "Cette application vous permet de rechercher des utilisateurs GitHub "
                        "et d'afficher leurs profils en quelques clics.",
                    textAlign: TextAlign.center, // Centrer le texte
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),

                  SizedBox(height: 20), // Espacement avant le bouton

                  // Bouton de navigation
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/users');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Fond noir du bouton
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: Text(
                      "Go to Users Page",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
