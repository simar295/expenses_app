import 'package:expenses_app/models/expenseclass.dart';
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
        category: Category.work),

    expenseclass(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("the chart"),
        Expanded(child: expenseslist(expenses: registeredExpenses)),
      ]),
    );
  }
}
