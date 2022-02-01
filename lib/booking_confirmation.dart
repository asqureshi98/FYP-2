import 'package:flutter/material.dart';
import 'package:fyp/payment_confirmed.dart';

class bookingConfirmation extends StatelessWidget {
  //const bookingConfirmation({Key? key}) : super(key: key);

  Widget builderRow(
    String fieldName,
    String variable,
    MediaQueryData mq,
  ) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: mq.size.width * 0.4,
          alignment: Alignment.centerRight,
          child: Text(
            '$fieldName: ',
          ),
        ),
        Container(
          width: mq.size.width * 0.4,
          alignment: Alignment.centerLeft,
          child: Text(
            variable,
          ),
        ),
      ],
    );
  }

  Widget builderContainer(
    BuildContext ctx,
    String label,
    double height,
  ) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: Text(
        label,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).textTheme.headline1;
    final mq = MediaQuery.of(context);
    var heightAvailable = mq.size.height;
    var myAppBar = AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      title: Text('Back'),
    );
    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: <Widget>[
          builderContainer(
              context, 'Booking Confirmation', heightAvailable * 0.1),
          Container(
            height: heightAvailable * 0.5,
            width: mq.size.width * 0.9,
            child: Card(
              elevation: 10,
              child: Container(
                width: double.infinity,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    builderRow('Reciept', 'beginner', mq),
                    builderRow('Expert Name', 'beginner', mq),
                    builderRow(
                        'Appointment Date', DateTime.now().day.toString(), mq),
                    builderRow(
                        'Appointment Time', DateTime.now().hour.toString(), mq),
                    builderRow('Session Duration', 'beginner', mq),
                    builderRow('Total Amount', 'beginner', mq),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Card(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Booking Confirmation',
//               style: TextStyle(fontSize: 25),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.all(5),
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.black)),
//               height: 250,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Reciept :', style: TextStyle(fontSize: 20)),
//                   Text('Expert Name :', style: TextStyle(fontSize: 20)),
//                   Text('Appointment Date :', style: TextStyle(fontSize: 20)),
//                   Text('Appointment Time :', style: TextStyle(fontSize: 20)),
//                   Text('Session Duration :', style: TextStyle(fontSize: 20)),
//                   Text('Total Amount :', style: TextStyle(fontSize: 20)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             modeofpayment(),
//           ],
//         ),
//       ),

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

//updated