import 'package:flutter/material.dart';
import 'package:fyp/providers/services.dart';
import 'package:provider/provider.dart';

class bookappointment extends StatelessWidget {
  //const bookappointment({Key? key}) : super(key: key);
  var retServices = [];

  @override
  Widget build(BuildContext context) {
    retServices = Provider.of<Services>(context).service;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Back'),
      ),
      body: Listviewbuilder(),
    );
  }
}

class Listviewbuilder extends StatelessWidget {
  const Listviewbuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            child: Center(
                child: Text(
              "Listview vertical",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
