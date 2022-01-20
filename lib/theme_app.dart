import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 60, 28, 91)))),
      primaryColorLight: Color.fromARGB(255, 119, 89, 153),
      primaryColor: Color.fromARGB(255, 60, 28, 91),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 128, 0)),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromARGB(255, 119, 89, 153),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 60, 28, 91),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 60, 28, 91),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 18,
          unselectedItemColor: Colors.black45,
          selectedItemColor: Color.fromARGB(255, 60, 28, 91),
          backgroundColor: Colors.white30),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        //foregroundColor: const Color(0x0000ff7f),
        backgroundColor: Colors.grey[900],
      ),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 128, 0)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 255, 128, 0)),
      textTheme: darkTextTheme,
    );
  }
}

//rgb(60, 28, 91)

//light accessent

//rgb(119, 89, 153)


//orang

//rgb(255, 128, 0)