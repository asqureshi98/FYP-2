import 'package:flutter/material.dart';

import './Customer.dart';

class Customers with ChangeNotifier {
  List<Customer> _customers = [];

  List<Customer> get customers {
    return [..._customers];
  }

  List<Customer> get basicCustomers {
    return _customers.where((customer) => !customer.blogger).toList();
  }

  List<Customer> get bloggers {
    return _customers.where((customer) => customer.blogger).toList();
  }

  Customer findByID(String id) {
    Customer customer = _customers
        .firstWhere((customer) => customer.customerID as String == id);
    return customer;
  }

  void addCustomer(Customer customer) {
    Customer newCustomer = customer;
    _customers.add(newCustomer);
    notifyListeners();
  }

  void updateCustomer(String id, Customer customer) {
    final customerIndex = _customers
        .indexWhere((customer) => customer.customerID as String == id);
    if (customerIndex >= 0) {
      _customers[customerIndex] = customer;
      notifyListeners();
    } else
      print('customer not found');
  }

  void deleteCustomer(String id) {
    _customers.removeWhere((customer) => customer.customerID as String == id);
    notifyListeners();
  }
}
