import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/parts_list_screen.dart';
import 'screens/shopping_cart_screen.dart';
import 'screens/checkout_screen.dart';

void main() {
  runApp(const PartsDepotApp());
}

class PartsDepotApp extends StatelessWidget {
  const PartsDepotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parts Depot',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        '/partsList': (context) => const PartsListScreen(),
        '/shoppingCart': (context) => const ShoppingCartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}
