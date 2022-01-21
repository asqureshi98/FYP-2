import 'package:flutter/material.dart';
import 'package:fyp/payment_confirmed.dart';



class bookingConfirmation extends StatelessWidget {
  const bookingConfirmation({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Booking Confirmation',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reciept :', style: TextStyle(fontSize: 20)),
                  Text('Expert Name :', style: TextStyle(fontSize: 20)),
                  Text('Appointment Date :', style: TextStyle(fontSize: 20)),
                  Text('Appointment Time :', style: TextStyle(fontSize: 20)),
                  Text('Session Duration :', style: TextStyle(fontSize: 20)),
                  Text('Total Amount :', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            modeofpayment(),
          ],
        ),
      ),
    );
  }
}

class modeofpayment extends StatelessWidget {
  const modeofpayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Mode of Payment', style: TextStyle(fontSize: 25)),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return paymentconfirmed();
            }));
          },
          child: Text('Credit Card'),
        )
      ],
    );
  }
}
