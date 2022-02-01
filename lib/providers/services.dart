import 'package:flutter/foundation.dart';

class Service {
  final String Service_ID;
  final String Service_Name;
  final String Description;
  String Base_Price;

  Service(
      {required this.Service_ID,
      required this.Service_Name,
      required this.Description,
      this.Base_Price = '0'});
}

class Services with ChangeNotifier {
  final List<Service> _services = [
    Service(Description: 'xyz', Service_Name: 'demo 1', Service_ID: '1'),
    Service(Description: 'xyz', Service_Name: 'demo 2', Service_ID: '2'),
    Service(Description: 'xyz', Service_Name: 'demo 3', Service_ID: '3'),
    Service(Description: 'xyz', Service_Name: 'demo 4', Service_ID: '4'),
  ];

  List<Service> get service {
    return [..._services];
  }

  Service findByID(String id) {
    return _services.firstWhere((services) => services.Service_ID == id);
  }

  void addService(Service newService) {
    _services.add(newService);
    notifyListeners();
  }

  void updateBasePrice(String newPrice, String id) {
    int index = _services.indexWhere((services) => services.Service_ID == id);
    _services[index].Base_Price = newPrice;
    notifyListeners();
  }

  void deleteService(String id) {
    _services.removeWhere((services) => services.Service_ID == id);
  }
}
