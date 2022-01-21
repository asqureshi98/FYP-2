import './User.dart';

class Expert {
  final int expertID;
  //final String description;
  double rating;
  final User userObj;
  final int userID;
  final int serviceID;

  Expert({
    required this.expertID,
    //required this.description,
    required this.userID,
    this.rating = 0,
    required this.userObj,
    required this.serviceID,
  });
}
