import 'package:flutter/material.dart';
import '../providers/Customer.dart';
import '../providers/expert.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './User.dart';

class Users with ChangeNotifier {
  //Map<String, dynamic> loggedInUser;
  //dynamic loggedInCustomer;
  Customer loggedInCustomer = Customer(
    customerID: -1,
    userID: -1,
    userObj: User(
      //dateJoined: '',
      dateOfBirth: '',
      //email: '',
      //gender: '',
      //phoneNumber: '',
      role: '',
      uID: '',
    ),
    //occupation: '',
    blogger: false,
  );
  Expert loggedInExpert = Expert(
    expertID: -1,
    serviceID: -1,
    //description: '',
    userID: -1,
    userObj: User(
      //dateJoined: '',
      dateOfBirth: '',
      //email: '',
      //gender: '',
      //phoneNumber: '',
      role: '',
      uID: '',
    ),
  );
  List<User> _users = [
    User(
      uID: '',
      firstName: 'farrukh',
      lastName: 'nadeem',
      role: 'client',
      dateOfBirth: 'June 3 1998',
      //email: 'farr',
      //password: 'app',
      //username: '',
      //gender: 'Male',
      //country: 'Pakistan',
      //city: 'Hyderabad',
      //phoneNumber: '090078601',
      //dateJoined: '...',
    ),
  ];

  List<User> get users {
    return [..._users];
  }

  User get user => _users[0];

  Future<void> logout() async {
    final url = Uri.https('beautyexperience.herokuapp.com', '/logout');
    try {
      await http.get(url);
      print("inside Users.dart logout function");
      print(_users.length);
      _users = [];
      print(_users.length);
      //   loggedInCustomer = Customer(
      //     customerID: -1,
      //     userID: -1,
      //     userObj: User(
      //       dateOfBirth: '',
      //       role: '',
      //       uID: '',
      //       //dateJoined: '',
      //       //email: '',
      //       //gender: '',
      //       //phoneNumber: '',
      //     ),
      //     //occupation: '',
      //     blogger: false,
      //   );
      //   loggedInExpert = Expert(
      //     expertID: -1,
      //     serviceID: -1,
      //     userID: -1,
      //     //description: '',
      //     userObj: User(
      //       dateOfBirth: '',
      //       role: '',
      //       uID: '',
      //       //dateJoined: '',
      //       //email: '',
      //       //gender: '',
      //       //phoneNumber: '',
      //     ),
      //   );
    } catch (e) {
      throw (e);
    }
  }

  Future<void> login(String username, String password) async {
    final url = Uri.https(
        'beautyexperience.herokuapp.com', '/user/$username/$password/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<User> fetchedUser = [];
      print(extractedData["userID"]['firstName']);
      print(
          "inside login function after signing in, to check data received after login request to server");
      print(extractedData);
      //extractedData.forEach((key, value) {
      fetchedUser.add(
        User(
          uID: extractedData["userID"]["userID"].toString(),
          firstName: extractedData["userID"]['firstName'],
          lastName: extractedData["userID"]['lastName'],
          role: extractedData["userID"]['role'],
          dateOfBirth: extractedData["userID"]['dob'],
          //email: username,
          //password: password,
          //username: username,
          //gender: extractedData["userID"]['gender'],
          //country: extractedData["userID"]['country'],
          //city: extractedData["userID"]['city'],
          //phoneNumber: extractedData["userID"]['phoneNumber'],
          //dateJoined: extractedData["userID"]['dateJoined'],
        ),
      );
      print(extractedData);
      _users = fetchedUser;

      //If saving experts or customers is needed
      //*************
      print(extractedData["userID"]['role']);
      extractedData["userID"]['role'] == 'expert'
          ? loggedInExpert = Expert(
              expertID: extractedData['expertID'],
              userID: extractedData["userID"]["userID"],
              userObj: fetchedUser[0],
              serviceID: extractedData['serviceID'],
              //description: extractedData['description'],
            )
          : loggedInCustomer = Customer(
              customerID: extractedData["customerID"],
              userID: extractedData["userID"]["userID"],
              userObj: fetchedUser[0],
              blogger: extractedData["blogger"],
              //occupation: "Occupation",
            );
      //*************

      notifyListeners();
      print(response.body.runtimeType);
      print("object");
      print(extractedData);
    } catch (error) {
      throw (error);
    }
  }

  //bool hasEmail(String email) {
  //  int index = _users.indexWhere((user) => user.email == email);
  //  if (index >= 0)
  //    return true;
  //  else
  //    return false;
  //}

  //User findByUsername(String username) {
  //  return _users.firstWhere((user) => user.username == username);
  //}

  Customer findCustomer() {
    return loggedInCustomer;
  }

  Future<void> addUser(
      {required User user,
      required String email,
      required String username,
      required String password,
      required String confirmation}) {
    final url = Uri.https('beautyexperience.herokuapp.com',
        '/register/'); //'https://sleepy-inlet-50645.herokuapp.com/register.json';
    return http.post(
      //Uri.parse(url),
      url,
      body: json.encode(
        {
          "firstName": user.firstName,
          "lastName": user.lastName,
          "role": user.role,
          "serv": 1,
          "dob": user.dateOfBirth,
          //"gender": user.gender,
          //"country": user.country,
          //"city": user.city,
          //"phoneNumber": user.phoneNumber,
          //"dateJoined": user.dateJoined,
          "email": email,
          "username": username,
          "password": password,
          "confirmation": confirmation
        },
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    ).then((value) {
      print("_user");
      print(_users);
      print("body");
      print(value.body);

      //final newUser = user;
      //print(users.length);
      //(User_ID: user.User_ID, First_Name: user.First_Name, Last_Name: user.Last_Name, Gender: user.Gender, Country: user.Country, City: user.City, Role: user.Role, Phone_Number: user.Phone_Number, Date_Of_Birth: user.Date_Of_Birth, Date_Joined: user.Date_Joined,);
      //_users.add(newUser);
      //print(users.length);
      final extractedData = json.decode(value.body) as Map<String, dynamic>;
      final List<User> fetchedUser = [];
      print(
          "inside add user function in Users.dart after signing in, to check data received after login request to server");
      print(extractedData["userID"]["userID"]);
      //print(user.password);
      //print(user.email);
      //print(user.username);
      print(extractedData['userID']);
      fetchedUser.add(
        User(
          uID: extractedData["userID"]["userID"],
          firstName: extractedData['userID']['firstName'],
          lastName: extractedData['userID']['lastName'],
          role: extractedData['userID']['role'],
          dateOfBirth: extractedData['userID']['dob'],
          //email: user.email,
          //password: user.password,
          //username: user.username,
          //gender: extractedData['userID']['gender'],
          //country: extractedData['userID']['country'],
          //city: extractedData['userID']['city'],
          //phoneNumber: extractedData['userID']['phoneNumber'],
          //dateJoined: extractedData['userID']['dateJoined'],
        ),
      );
      _users = fetchedUser;
      print("new _user");
      print(_users[0]);
      //If saving experts or customers is needed
      //*************
      extractedData["userID"]['role'] == 'expert'
          ? loggedInExpert = Expert(
              expertID: extractedData['expertID'],
              userID: extractedData["userID"]["userID"],
              userObj: fetchedUser[0],
              serviceID: extractedData['serviceID'],
              //description: extractedData['description'],
            )
          : loggedInCustomer = Customer(
              customerID: extractedData["customerID"],
              userID: extractedData["userID"]["userID"],
              userObj: fetchedUser[0],
              blogger: extractedData["blogger"],
              //occupation: "Occupation",
            );
      print("customer");
      print(loggedInCustomer);
      //*************

      //print(extractedData);
      //extractedData.forEach((key, value) {
      notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }

  void demoAdd(User user) {
    final List<User> fetchedUser = [];
    fetchedUser.add(user);
    _users = fetchedUser;
    notifyListeners();
  }

  //void updateUser(String email, User newUser) {
  //  final userIndex = _users.indexWhere((user) => user.email == email);
  //  if (userIndex >= 0) {
  //    _users[userIndex].firstName = newUser.firstName;
  //    _users[userIndex].lastName = newUser.lastName;
  //
  //    _users[userIndex].image = newUser.image;
  //    //_users[userIndex].password = newUser.password;
  //    //_users[userIndex].country = newUser.country;
  //    //_users[userIndex].city = newUser.city;
  //    notifyListeners();
  //  } else {
  //    print('...');
  //  }
  //}

  //void deleteUser(String email) {
  //  _users.removeWhere((user) => user.email == email);
  //  notifyListeners();
  //}
}

// "firstName"
// "lastName"
// "gender"
// "country"
// "city"
// "phoneNumber"
// "role"
// "email"
// "username"
// "password"
// "confirmation"
