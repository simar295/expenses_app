import 'package:expenses_app/expensewidget.dart';
import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/material.dart';
import './expenses.dart';

class expenseslist extends StatelessWidget {
  expenseslist({required this.expenses, required this.removefunction});

  final List<expenseclass> expenses;
  final void Function(expenseclass value) removefunction;

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
                color: Theme.of(context).colorScheme.error,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 0),
                child: Icon(
                  Icons.delete_forever_rounded,
                  size: 50,
                ),
                padding: EdgeInsets.only(right: 20)),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              direction == DismissDirection.startToEnd;
              removefunction(expenses[index]);
            },
            child: expensewidget(expenses[
                index])) //accessing a single expense from the list of two expenses
        //ek set of list bheji aur uska widget build ho gya
        /*VERY BIG CONCEPT */
        );
  }
}
