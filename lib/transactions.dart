import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with actual number of transactions
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              index % 2 == 0 ? Icons.arrow_downward : Icons.arrow_upward,
              color: index % 2 == 0 ? Colors.green : Colors.red,
            ),
            title: Text(
              index % 2 == 0
                  ? 'Credited: ₹5000'
                  : 'Debited: ₹2000', // Replace with actual transaction details
            ),
            subtitle: Text(
              index % 2 == 0
                  ? 'Money added to wallet'
                  : 'Money debited from wallet', // Replace with actual details
            ),
            trailing: const Text('22 Oct 2024'), // Replace with actual date
          );
        },
      ),
    );
  }
}
