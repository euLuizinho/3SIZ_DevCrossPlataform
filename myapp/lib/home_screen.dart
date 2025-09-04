import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final  String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu APP")),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              
              color: const Color.fromARGB(255, 250, 19, 3),
            ),
          ),
          SizedBox(width: 30,),
          Expanded(
            flex: 2,
            child: Container(
             
              color: const Color.fromARGB(255, 253, 233, 56),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              
              color: const Color.fromARGB(255, 4, 122, 8),
            ),
          )
        ],
      ),  
    );
  }
}