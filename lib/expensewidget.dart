//creating a full wdiget to be displayed by the itembuilder of the listview.builder
import 'package:expenses_app/models/expenseclass.dart';
import 'package:flutter/material.dart';

class expensewidget extends StatelessWidget {
  const expensewidget(this.expense,
      {/* required this.expense */ super.key}); //note , no need to use required in positional arguments , only for named arguments

  final expenseclass expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), //shows decimal values till 2 places
                Spacer(),
                Row(
                  children: [
                    Icon(categoryicons[expense.categoryy]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(expense.formatteddate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
