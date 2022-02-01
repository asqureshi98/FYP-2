import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyp/booking_confirmation.dart';

class artistdetails extends StatelessWidget {
  const artistdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue1 = 'Availabledate';
    String dropdownvalue2 = 'Availabletime';
    String dropdownvalue3 = 'Beginner';
    // List of items in our dropdown menu
    var items = [
      'Availabledate',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    var items2 = [
      'Availabletime',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

     var items3 = [
      'Beginner',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Back'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nabila',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: [
                Image.network(
                  'https://ritecaremedicalofficepc.com/wp-content/uploads/2019/09/img_avatar.png',
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.35,
                      maxWidth: MediaQuery.of(context).size.width * 0.5),
                  child: Text(
                    'She is a wonderful beautician, verys skilled and passionate about her work',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Text(
              'Book a Slot: ',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.end,
            ),
            DropdownButton(
                // Initial Value
                value: dropdownvalue1,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue1 = newValue!;
                  });
                }),
            DropdownButton(
                // Initial Value
                value: dropdownvalue2,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items2.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue2= newValue!;
                  });
                }),
            Text(
              'Select Level: ',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.end,
            ),
            DropdownButton(
                // Initial Value
                value: dropdownvalue3,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items3.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue3 = newValue!;
                  });
                }),
            SizedBox(
              height: 15,
            ),
            bookingconfirmationbutton(),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class bookingconfirmationbutton extends StatelessWidget {
  const bookingconfirmationbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('', style: TextStyle(fontSize: 25)),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return bookingConfirmation();
            }));
          },
          child: Text('Booking confirm'),
        )
      ],
    );
  }
}
