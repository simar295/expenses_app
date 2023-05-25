import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class newoverlay extends StatefulWidget {
  const newoverlay({super.key});

  @override
  State<newoverlay> createState() => _newoverlayState();
}

class _newoverlayState extends State<newoverlay> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime? selectedate;
  category selectedcategory = category.leisure;

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

  void datepicker() async {
    final now = DateTime.now();
    /* final firstdate = DateTime(now.year, now.month + 2, now.day); */

    final pickeddate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));
    /* .then((value) => null) */
    setState(() {
      selectedate = pickeddate;
    });
  }

//validating input and checking all types of user errors
  void submitdata() {
    final enteredamount = double.tryParse(amountcontroller
        .text); //tryparse take string input and returns a double number
    final amountisinvalid = enteredamount == null || enteredamount <= 0;
    if (titlecontroller.text.trim().isEmpty ||
        amountisinvalid ||
        selectedate == null) {}
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
                Text(selectedate == null
                    ? "no date selected "
                    : formatter.format(
                        selectedate! //force dart to tell this not be null
                        )),
                IconButton(
                    onPressed: datepicker, icon: Icon(Icons.calendar_month))
              ],
            ),
          )
        ]),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton(
                value: selectedcategory,
                items: category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    selectedcategory = value;
                  });
                  ;
                }),
            const Spacer(),
            TextButton(
                //removing the overlay using navigator.pop method , here context is the meta data of full overlay
                onPressed: () => Navigator.pop(context),
                child: Text("cancel")),
            ElevatedButton(
                onPressed: () {
                  submitdata();
                },
                child: Text("save"))
          ],
        )
      ]),
    );
  }
}
