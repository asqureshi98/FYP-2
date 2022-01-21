import 'package:flutter/material.dart';

class makeupartisits extends StatelessWidget {
  const makeupartisits({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Back'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Beauty Exprience', style: TextStyle(fontSize: 25)),
            
          ],
        ),
      ),
  }
}