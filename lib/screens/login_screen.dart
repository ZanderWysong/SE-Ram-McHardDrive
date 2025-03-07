import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts Depot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Placeholder for a logo or an image
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              margin: const EdgeInsets.only(bottom: 24),
              child: const Center(child: Text('Logo')),
            ),

            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
              child: const Text('Create an account'),
            ),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/partsList');
              },
              child: const Text('Browse Parts'),
            ),
          ],
        ),
      ),
    );
  }
}
