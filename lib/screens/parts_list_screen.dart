import 'package:flutter/material.dart';

class PartsListScreen extends StatefulWidget {
  const PartsListScreen({Key? key}) : super(key: key);

  @override
  State<PartsListScreen> createState() => _PartsListScreenState();
}

class _PartsListScreenState extends State<PartsListScreen> {
  final _searchController = TextEditingController();

  // Dummy data
  final List<Map<String, dynamic>> _parts = [
    {'name': 'Part A', 'price': 10.0},
    {'name': 'Part B', 'price': 12.0},
    {'name': 'Part C', 'price': 8.5},
    {'name': 'Part D', 'price': 15.0},
    // Add more parts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Parts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search logic or show a search bar
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/shoppingCart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Browse Parts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Shopping Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/shoppingCart');
              },
            ),
            // Add more menu items if needed
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _parts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final part = _parts[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Placeholder for part image
                  Expanded(
                    child: Container(
                      color: Colors.grey[200],
                      child: const Center(child: Text('Image')),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Name: ${part['name']}'),
                  Text('Price: \$${part['price']}'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add to cart logic
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
