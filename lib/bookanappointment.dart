

import 'package:flutter/material.dart';
import 'package:fyp/providers/services.dart';
import 'package:provider/provider.dart';

class bookappointment extends StatelessWidget {
  //const bookappointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Service> retService = Provider.of<Services>(context).service;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Back'),
      ),
      body: ListViewBuilder(retService: retService),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key? key,
    required this.retService,
  }) : super(key: key);

  final List<Service> retService;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          
          return Container(
            padding: EdgeInsets.only(left: 5,top: 50),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.grey),
              child: ElevatedButton(
                child: Text(
                  retService[index].Service_Name,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          );
        },
        itemCount: retService.length,
      ),
    );
  }
}
