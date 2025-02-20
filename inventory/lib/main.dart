// main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const WarehouseApp());
}

class WarehouseApp extends StatelessWidget {
  const WarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(String name, int quantity) {
    setState(() {
      _products.add({'name': name, 'quantity': quantity});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Warehouse Management')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          var product = _products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('Stock: ${product['quantity']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductScreen(onAddProduct: _addProduct),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  final Function(String, int) onAddProduct;
  const AddProductScreen({super.key, required this.onAddProduct});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _submit() {
    String name = _nameController.text.trim();
    int quantity = int.tryParse(_quantityController.text.trim()) ?? 0;
    if (name.isNotEmpty && quantity > 0) {
      widget.onAddProduct(name, quantity);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Product Name')),
            TextField(controller: _quantityController, decoration: const InputDecoration(labelText: 'Quantity'), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: const Text('Add Product')),
          ],
        ),
      ),
    );
  }
}
