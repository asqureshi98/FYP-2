import '../providers/User.dart';

class Customer {
  final int customerID;
  //final String occupation;
  final int userID;
  final User userObj;
  final bool blogger;

  Customer(
      {required this.customerID,
      //required this.occupation,
      required this.userID,
      required this.userObj,
      required this.blogger});
}
