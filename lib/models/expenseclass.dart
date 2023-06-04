import 'package:expenses_app/expenses.dart';
import 'package:expenses_app/expenseslist.dart';
import 'package:expenses_app/expensewidget.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum category { food, travel, leisure, work }

const categoryicons = {
  category.food: Icons.lunch_dining,
  category.travel: Icons.flight_takeoff,
  category.leisure: Icons.movie_creation_outlined,
  category.work: Icons.work,
};

class expenseclass {
  expenseclass({
    required this.title,
    required this.amount,
    required this.date,
    required this.categoryy,
  }) : id = uuid.v4(); //initializer list concept


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final category categoryy;

  String get formatteddate {
    return formatter.format(date);
  }
}

class expensebucket {
  expensebucket(this.cat, this.exp);

  expensebucket.forcategory(List<expenseclass> allexpenses, this.cat)
      : exp = allexpenses
            .where((expense) => expense.categoryy == cat)
            .toList();

  final category cat;
  final List<expenseclass> exp;

  double get totalexpense {
    double sum = 0;
    for (final expense in exp) {
      sum += expense.amount;
    }
    return sum;
  }
}
