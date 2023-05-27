import 'package:flutter/material.dart';
import './expenses.dart';
import 'package:google_fonts/google_fonts.dart';

var colorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(198, 62, 198, 240));
var darkcolorscheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 255, 1, 200), brightness: Brightness.dark);

void main(List<String> args) {
  runApp(mainclass());
}

class mainclass extends StatefulWidget {
  const mainclass({super.key});
  @override
  State<mainclass> createState() => mainclassState();
}

class mainclassState extends State<mainclass> {
  var getmode = ThemeMode.light;

  void switchmode(bool a) {
    setState(() {
      if (a) {
         getmode = ThemeMode.dark;
      }else{
        getmode = ThemeMode.light;
      }
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: darkcolorscheme,
        cardTheme: CardTheme().copyWith(
            color: darkcolorscheme.onSecondary,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
      ),
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
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(color: Color.fromARGB(255, 255, 21, 21))),
      ),
      themeMode: getmode,
      home: expenses(
        handler: switchmode,
      ),
    );
  }
}
