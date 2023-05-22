import 'package:expenses_app/expensewidget.dart';
import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/material.dart';
import './expenses.dart';

class expenseslist extends StatelessWidget {
  expenseslist({required this.expenses});

  final List<expenseclass> expenses;

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => expensewidget(expenses[index])
        //accessing a single expense from the list of two expenses
        //ek set of list bheji aur uska widget build ho gya
        /*VERY BIG CONCEPT */
        );
  }
}
