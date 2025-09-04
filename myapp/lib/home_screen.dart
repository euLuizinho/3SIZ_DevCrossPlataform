import 'package:flutter/material.dart';
import 'package:myapp/input_costum.dart';

class HomeScreen extends StatefulWidget {
  final  String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

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
              child: Column(
                children: [
                  Text("Login"),
                  InputCostum(controller: nameController)
                ],
              ),
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