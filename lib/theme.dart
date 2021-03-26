import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO consider creating custom theme classes
class IllumeThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF258EEF),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFB1E0F3),
    secondaryVariant: Color(0xFF258EEF),
    background: Color(0xFFF6FAFF),
    surface: Color(0xFFB1E0F3),
    onBackground: Colors.black,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF2270CD),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF122A4E),
    secondaryVariant: Color(0xFF1f529e),
    background: Color(0xFF000815),
    surface: Color(0xFF122A4E),
    onBackground: Colors.white,
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.quicksand(
        fontWeight: _bold, fontSize: 42, letterSpacing: -1.5),
    headline2: GoogleFonts.quicksand(
        fontWeight: _regular, fontSize: 38, letterSpacing: -0.5),
    headline3: GoogleFonts.quicksand(
        fontWeight: _bold, fontSize: 34, letterSpacing: 0.25),
    headline4: GoogleFonts.quicksand(
        fontWeight: _medium, fontSize: 34, letterSpacing: 0.25),
    headline5: GoogleFonts.quicksand(
        fontWeight: _semiBold, fontSize: 22, letterSpacing: 0),
    headline6: GoogleFonts.quicksand(
        fontWeight: _bold, fontSize: 20, letterSpacing: 0.15),
    subtitle1: GoogleFonts.quicksand(
        fontWeight: _medium, fontSize: 18, letterSpacing: 0.15),
    subtitle2: GoogleFonts.quicksand(
        fontWeight: _medium, fontSize: 16, letterSpacing: 0.1),
    bodyText1: GoogleFonts.roboto(
        fontWeight: _regular, fontSize: 20, letterSpacing: 0.5),
    bodyText2: GoogleFonts.roboto(
        fontWeight: _regular, fontSize: 18, letterSpacing: 0.25),
    button: GoogleFonts.roboto(
        fontWeight: _medium, fontSize: 14, letterSpacing: 1.25),
    caption: GoogleFonts.roboto(
        fontWeight: _regular, fontSize: 14, letterSpacing: 0.4),
    overline: GoogleFonts.roboto(
        fontWeight: _regular, fontSize: 10, letterSpacing: 1.5),
  );
}
