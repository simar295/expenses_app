import 'package:expenses_app/expenses.dart';
import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class newoverlay extends StatefulWidget {
  const newoverlay({super.key, required this.addfunction});

  final void Function(expenseclass value) addfunction;

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
        selectedate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("invalid input "),
          content: Text("please enter a valid input "),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("okah"),
            )
          ],
        ),
      );
      return;
    }

    widget.addfunction(expenseclass(
        title: titlecontroller.text,
        amount: enteredamount,
        date: selectedate!,
        categoryy: selectedcategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 68, 16, 16),
      child: Column(children: [
        TextField(
          /* onChanged: savetitleinput, */
          controller: titlecontroller,
          maxLength: 50,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 66, 125, 145),
                ),
              ),
              labelText: "Title",
              labelStyle: GoogleFonts.poppins()),

          /*  keyboardType: TextInputType.phone, */
        ),
        Row(children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                  labelText: "Amount",
                  prefixText: "\$ ",
                  labelStyle: GoogleFonts.poppins()),
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
          ),

          SizedBox(
            width: 10,
          ),
          //WE  USE EXPANDED WHEN USING ROW INSIDE A ROW OR COLUMN INSIDE A COLOUMN
          //EXPANDED TAKES AS MUCH SPACE AS IT IS NEEDED
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  selectedate == null
                      ? "Select Date "
                      : formatter.format(
                          selectedate! //force dart to tell this not be null
                          ),
                  style: GoogleFonts.poppins(),
                ),
                IconButton(
                  onPressed: datepicker,
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.blueAccent,
                  ),
                )
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
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
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
                }),
            const Spacer(),
            TextButton(
                //removing the overlay using navigator.pop method , here context is the meta data of full overlay
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "cancel",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  submitdata();
                },
                child: Text(
                  "save expense",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  /*   style: TextStyle(color: Colors.white), */
                ))
          ],
        )
      ]),
    );
  }
}
