import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample order data
    final List<Map<String, dynamic>> orders = [
      {
        'orderID': '12345',
        'productName': 'Abstract Art Piece',
        'estimatedArrival': '25th Oct 2024',
        'status': 'In Transit',
      },
      {
        'orderID': '67890',
        'productName': 'Modern Sculpture',
        'estimatedArrival': '29th Oct 2024',
        'status': 'Shipped',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order['orderID']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Product: ${order['productName']}'),
                  const SizedBox(height: 8),
                  Text('Estimated Arrival: ${order['estimatedArrival']}'),
                  const SizedBox(height: 8),
                  Text('Status: ${order['status']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
