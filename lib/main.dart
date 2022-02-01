import 'package:flutter/material.dart';
import 'package:fyp/bookanappointment.dart';
import 'package:fyp/providers/Experts.dart';
import 'package:fyp/providers/services.dart';
import 'package:provider/provider.dart';
import 'booking_confirmation.dart';
//import 'bookanappointment.dart';
import 'artists.dart';
import 'artistdetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Services(),
        ),
        ChangeNotifierProvider.value(
          value: Experts(),
        )],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: artistdetails(),
      ),
    );
  }
}
