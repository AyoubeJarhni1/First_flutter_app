import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('home Page',style:Theme.of(context).textTheme.headlineLarge ),
      ),
      drawer: Drawer(),
      body:   Center (
        child: Text("home center",style: Theme.of(context).textTheme.headlineLarge,),
      ),

    );
  }
}