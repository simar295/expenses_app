import 'package:flutter/material.dart';

class newoverlay extends StatefulWidget {
  const newoverlay({super.key});

  @override
  State<newoverlay> createState() => _newoverlayState();
}

class _newoverlayState extends State<newoverlay> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  void dispose() {
    titlecontroller.dispose();
    amountcontroller.dispose();
    super.dispose();
  }
  /*storing input APPROACH 1 
  var savedtitle = ''; 
  void savetitleinput(String input) {
    savedtitle = input;
  } */

  void datepicker() {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 2, now.month, now.day);

    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          /* onChanged: savetitleinput, */
          controller: titlecontroller,
          maxLength: 50,
          decoration: InputDecoration(labelText: "Title"),
          /*  keyboardType: TextInputType.phone, */
        ),
        Row(children: [
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration(labelText: "Amount", prefixText: "\$ "),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          //WE  USE EXPANDED WHEN USING ROW INSIDE A ROW OR COLUMN INSIDE A COLOUMN
          //EXPANDED TAKES AS MUCH SPACE AS IT IS NEEDED
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("selected date"),
                IconButton(
                    onPressed: datepicker, icon: Icon(Icons.calendar_month))
              ],
            ),
          )
        ]),
        Row(
          children: [
            TextButton(
                //removing the overlay using navigator.pop method , here context is the meta data of full overlay
                onPressed: () => Navigator.pop(context),
                child: Text("cancel")),
            ElevatedButton(
                onPressed: () {
                  print(titlecontroller.text);
                  print(amountcontroller.text);
                },
                child: Text("save"))
          ],
        )
      ]),
    );
  }
}
