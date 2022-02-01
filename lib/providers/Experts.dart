import 'package:flutter/material.dart';
import 'package:fyp/providers/User.dart';

import './expert.dart';

class Experts with ChangeNotifier {
  final List<Expert> _experts = [
    Expert(
        expertID: 1,
        userID: 2,
        userObj: User(uID: '2', role: 'client', dateOfBirth: 'farrukh'),
        serviceID: 1),
    Expert(
        expertID: 2,
        userID: 3,
        userObj: User(uID: '3', role: 'client', dateOfBirth: 'samad'),
        serviceID:1),
    Expert(
        expertID: 3,
        userID: 4,
        userObj: User(uID: '4', role: 'client', dateOfBirth: 'vaneeza'),
        serviceID: 1)
  ];

  List<Expert> get experts {
    return [..._experts];
  }

  Expert findById(String id) {
    return _experts.firstWhere((element) => element.expertID as String == id);
  }

  void addExpert(Expert expert) {
    final newExpert = expert;
    //(User_ID: user.User_ID, First_Name: user.First_Name, Last_Name: user.Last_Name, Gender: user.Gender, Country: user.Country, City: user.City, Role: user.Role, Phone_Number: user.Phone_Number, Date_Of_Birth: user.Date_Of_Birth, Date_Joined: user.Date_Joined,);
    _experts.add(newExpert);
    // _experts.insert(0, newUser); // at the start of the list
    notifyListeners();
  }

  void updateUser(String id, Expert newExpert) {
    final expertIndex =
        _experts.indexWhere((expert) => expert.expertID as String == id);
    if (expertIndex >= 0) {
      _experts[expertIndex] = newExpert;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteExpert(String id) {
    _experts.removeWhere((expert) => expert.expertID as String == id);
    notifyListeners();
  }
}
