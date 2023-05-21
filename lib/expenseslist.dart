import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/material.dart';
import './expenses.dart';

class expenseslist extends StatelessWidget {
  expenseslist({required this.expenses});

  final List<expenseclass> expenses;

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
