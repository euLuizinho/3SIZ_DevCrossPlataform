import 'package:checkpoint/service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _serviceTypeController;
  final List<Service> services = [];
  final GlobalKey _formKey = GlobalKey();
  

  @override
  void initState(){
    _nameController = TextEditingController();
    _serviceTypeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _nameController.dispose();
    _serviceTypeController.dispose();
    super.dispose();
  }

  void save(){
    final name = _nameController.text;
    final serviceType = _serviceTypeController.text;
    final service = Service(name: name, serviceType: serviceType);
    setState(() {
      services.add(service);
    });
    clear();
  }

  void clear(){
    _nameController.clear();
    _serviceTypeController.clear();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oficina do bairro"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text("Informe o nome do cliente:"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _serviceTypeController,
                          decoration: InputDecoration(
                            label: Text("Informe o tipo de service"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            save();
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
              color: Colors.yellow,
              child: Column(
                children: [
                  Text("Exploradores"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(services[index].presenterName()),
                            subtitle: Text(services[index].presenterService()));
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