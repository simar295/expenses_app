import 'package:flutter/material.dart';
import './expenses.dart';
import 'package:google_fonts/google_fonts.dart';

var colorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(198, 62, 198, 240));

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        /* textTheme: GoogleFonts.poppinsTextTheme(), */
        /* textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)), */
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 196, 216, 250),
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: colorscheme.onPrimaryContainer,
            foregroundColor: colorscheme.primaryContainer),
        cardTheme: CardTheme().copyWith(
            color: colorscheme.onSecondary,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorscheme.primaryContainer)),
      ),
      home: expenses(),
    ),
  );
}
