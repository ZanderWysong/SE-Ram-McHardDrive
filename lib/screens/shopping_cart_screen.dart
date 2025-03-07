import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  // Dummy cart data
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Part A', 'price': 10.0, 'qty': 1},
    {'name': 'Part B', 'price': 12.0, 'qty': 2},
    {'name': 'Part C', 'price': 8.5, 'qty': 1},
  ];

  double get _subtotal {
    return _cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['qty']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Img')),
                  ),
                  title: Text('Name: ${item['name']}'),
                  subtitle: Text('Price: \$${item['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton<int>(
                        value: item['qty'],
                        items: List.generate(10, (i) => i + 1)
                            .map<DropdownMenuItem<int>>(
                          (qty) {
                            return DropdownMenuItem<int>(
                              value: qty,
                              child: Text(qty.toString()),
                            );
                          },
                        ).toList(),
                        onChanged: (newQty) {
                          setState(() {
                            item['qty'] = newQty ?? 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Subtotal: \$${_subtotal.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
