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
          title: Text("FLUTTER EXPENSE TRACKER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          actions: [IconButton(onPressed: openoverlay, icon: Icon(Icons.add))]),
      body: Column(children: [
        Text("the chart"),
        Expanded(child: maincontent),
        Container(
          padding: EdgeInsets.only(bottom: 60),
          child: IconButton(
            color: Color.fromARGB(255, 255, 255, 255),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 241, 84, 79))),
            onPressed: openoverlay,
            icon: Icon(
              Icons.add,
              size: 70,
            ),
          ),
        ),
      ]),
    );
  }
}
