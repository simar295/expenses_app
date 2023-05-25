import 'package:expenses_app/models/expenseclass.dart';
import 'package:expenses_app/newoverlay.dart';
import 'package:flutter/material.dart';
import './expenseslist.dart';

// ignore: camel_case_types
class expenses extends StatefulWidget {
  const expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return expensesstate();
  }
}

class expensesstate extends State<expenses> {
  final List<expenseclass> registeredExpenses = [
    //dummy data
    expenseclass(
        title: 'Flutter Course',
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
    showModalBottomSheet(context: context, builder: (ctx) => newoverlay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("FLUTTER EXPENSE TRACKER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          actions: [IconButton(onPressed: openoverlay, icon: Icon(Icons.add))]),
      body: Column(children: [
        Text("the chart"),
        Expanded(child: expenseslist(expenses: registeredExpenses)),
      ]),
    );
  }
}
