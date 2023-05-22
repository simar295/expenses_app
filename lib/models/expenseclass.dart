import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryicons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.work,
};

class expenseclass {
  expenseclass({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //initializer list concept

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatteddate {
    return formatter.format(date);
  }
}
