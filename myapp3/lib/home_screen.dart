import 'package:flutter/material.dart';
import 'package:myapp3/explorer.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late GlobalKey _formKey;
  final List<Explorer> listExplorers = [];

  @override
  void initState() {
    _formKey = GlobalKey();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: const Color.fromARGB(255, 207, 207, 207),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Formulário"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text("Informe o nome do explorador"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            label: Text("Informe a idade do explorador"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            final name = _nameController.text;
                            final age = _ageController.text;
                            final explorer = Explorer(name: name, age: age);

                            setState(() {
                              listExplorers.add(explorer);
                            });

                            _nameController.clear();
                            _ageController.clear();
                          },
                          child: Text("Salvar"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 255, 183, 243),
              child: Column(
                children: [
                  Text("Exploradores"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listExplorers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listExplorers[index].name),
                          subtitle: Text(listExplorers[index].age),
                        );
                      },
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
