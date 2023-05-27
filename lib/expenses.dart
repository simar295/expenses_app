import 'dart:ffi';

import 'package:expenses_app/chart.dart';
import 'package:expenses_app/models/expenseclass.dart';
import 'package:expenses_app/newoverlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './expenseslist.dart';

// ignore: camel_case_types
class expenses extends StatefulWidget {
  const expenses({
    super.key,
    required this.handler,
  });

  final Function handler;

  @override
  State<StatefulWidget> createState() {
    return expensesstate();
  }
}

class expensesstate extends State<expenses> {
  final List<expenseclass> registeredExpenses = [
    //dummy data
    expenseclass(
        title: 'Flutter Course made by simar',
        amount: 19.99,
        date: DateTime.now(),
        categoryy: category.work),

    expenseclass(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      categoryy: category.leisure,
    ),
  ];

  void openoverlay() {
    //opens an overlay to the screen
    showModalBottomSheet(
        isScrollControlled: true, //prevent overlapping of keyboard
        context: context,
        builder: (ctx) => newoverlay(
              addfunction: addexpense,
            ));
  }

  void addexpense(expenseclass value) {
    setState(() {
      registeredExpenses.add(value);
    });
  }

  void removexpense(expenseclass value) {
    final expenseindex = registeredExpenses.indexOf(value);
    setState(() {
      registeredExpenses.remove(value);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value.title + " removed "),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseindex, value);
            });
          }),
    ));
  }

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(
      child: Text("start adding expenses"),
    );
    if (registeredExpenses.isNotEmpty) {
      maincontent = expenseslist(
        expenses: registeredExpenses,
        removefunction: removexpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "FLUTTER EXPENSE TRACKER",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
            /*  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), */
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(15),
              child: CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      switchValue = value;
                      widget.handler(value);
                      //..............
                    });
                  }),
            ),
          ]),
      body: Column(children: [
        Chart(expenses: registeredExpenses),
        Expanded(child: maincontent),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 60,
                spreadRadius: 5,
                offset: Offset(
                  -5,
                  15,
                ),
                color: Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ),
              ),
            ]),
            child: IconButton(
              color: Color.fromARGB(255, 255, 255, 255),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 255, 77, 77)),
              ),
              onPressed: openoverlay,
              icon: Icon(
                Icons.add,
                size: 50,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
