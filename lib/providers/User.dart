class User {
  final String uID;
  //final String email;
  //String password;
  //String username;
  //String confirmation;
  String image;
  String firstName;
  String lastName;
  //final String gender;
  //String country;
  //String city;
  //final String phoneNumber;
  final String dateOfBirth;
  //final String dateJoined;
  final String role;

  User({
    required this.uID,
    //required this.email,
    //this.password = '',
    //this.username = '',
    //this.confirmation = '',
    this.image = '',
    this.firstName = '',
    this.lastName = '',
    //required this.gender,
    //this.country = '',
    //this.city = '',
    required this.role,
    //required this.phoneNumber,
    required this.dateOfBirth,
    //required this.dateJoined,
  });
}
