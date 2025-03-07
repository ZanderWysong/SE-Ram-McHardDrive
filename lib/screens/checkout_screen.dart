import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cardInfoController = TextEditingController();
  final _shippingAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This would typically be passed in or retrieved from a cart provider.
    final List<String> cartItems = ['Part A', 'Part B', 'Part C'];
    final double totalPrice = 30.5; // Example total

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var item in cartItems) Text(item),
            Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 16),

            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
            ),
            TextField(
              controller: _cardInfoController,
              decoration: const InputDecoration(labelText: 'Card Information'),
            ),
            TextField(
              controller: _shippingAddressController,
              decoration:
                  const InputDecoration(labelText: 'Shipping Address'),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // go back to parts or cart
                  },
                  child: const Text('Back to Parts'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement order placement logic
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
