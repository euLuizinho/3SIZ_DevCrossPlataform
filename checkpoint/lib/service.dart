class Service {
  final String name;
  final String serviceType;

  Service ({required this.name, required this.serviceType});

  String presenterName(){
    return "Nome: $name";
  }

  String presenterService(){
    return "Serviço: $serviceType";
  }
}