import 'package:flutter/material.dart';

class paymentconfirmed extends StatelessWidget {
  const paymentconfirmed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Booking Confirmation', style: TextStyle(fontSize: 25)),
            //CheckMark Icon
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
              child: Icon(Icons.check_box),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Payment Confirmed', style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 15,
            ),
            Text('Email Sent', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
