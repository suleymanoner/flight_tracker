import 'package:flight_tracker/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flight_tracker/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const TabsScreen(),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: AppTheme().cardTheme,
        elevatedButtonTheme: AppTheme().elevatedButtonTheme,
        textTheme: AppTheme().textTheme,
        snackBarTheme: AppTheme().snackBarTheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primary,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: AppTheme().darkCardTheme,
        elevatedButtonTheme: AppTheme().darkElevatedButtonTheme,
        textTheme: AppTheme().darkTextTheme,
        snackBarTheme: AppTheme().snackBarTheme,
      ),
    );
  }
}
