import 'package:firstapp/pages/homePages/homePage.dart';
import 'package:firstapp/pages/usersPage/usersPage.dart';
import 'package:flutter/material.dart';

void main() =>
  runApp(Myapp() );

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
     routes: {
       "/": (context) => UsersPage(),
       "/users": (Context) => HomePage()
     },
    );
  }
}





