import 'package:flutter/material.dart';
import 'orders.dart'; // Import the Orders page
import 'wallet.dart'; // Import the Wallet page
import 'transactions.dart'; // Import the Transactions page
import 'search_page.dart'; // Import the Search page
import 'post_upload.dart'; // Import the PostUpload page
import 'nfc.dart'; // Import the NFC page

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.photo),
            color: Colors.red,
            onPressed: () {},
            iconSize: 28,
            splashRadius: 20,
            tooltip: "Gallery",
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 91, 97, 99),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            iconSize: 28,
            splashRadius: 20,
            tooltip: "Search bar",
          ),
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.grey[600],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostUpload()),
              );
            },
            iconSize: 28,
            splashRadius: 20,
            tooltip: "Add",
          ),
          IconButton(
            icon: const Icon(Icons.real_estate_agent),
            color: Colors.grey[600],
            onPressed: () {},
            iconSize: 28,
            splashRadius: 20,
            tooltip: "Circle",
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            iconSize: 28,
            onSelected: (String value) {
              switch (value) {
                case 'Settings':
                  print('Settings selected');
                  break;
                case 'Privacy':
                  print('Privacy selected');
                  break;
                case 'NFC':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NFCPage()), // Navigate to NFCPage
                  );
                  break;
                case 'Transactions':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionsPage()),
                  );
                  break;
                case 'Wallet':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WalletPage()),
                  );
                  break;
                case 'Orders':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrdersPage()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem(
                  value: 'Privacy',
                  child: Text('Privacy'),
                ),
                const PopupMenuItem(
                  value: 'NFC',
                  child: Text('NFC'),
                ),
                const PopupMenuItem(
                  value: 'Transactions',
                  child: Text('Transactions'),
                ),
                const PopupMenuItem(
                  value: 'Wallet',
                  child: Text('Wallet'),
                ),
                const PopupMenuItem(
                  value: 'Orders',
                  child: Text('Orders'),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
