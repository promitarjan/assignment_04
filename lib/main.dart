import 'package:flutter/material.dart';
import 'CartItem.dart'; // Import the CartItem model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // List of items with image URLs
  List<CartItem> cartItems = [
    CartItem(
      name: "Pullover",
      color: "Black",
      size: "L",
      price: 51.0,
      imageUrl:
          "https://media.istockphoto.com/id/932170554/photo/white-color-formal-shirt-with-button-down-collar-isolated-on-white.jpg?s=612x612&w=0&k=20&c=ZUw_-P78BLTVUdMOft20nIwLv-cTOdtFw-4rUe0kr0A=",
    ),
    CartItem(
      name: "T-Shirt",
      color: "Gray",
      size: "L",
      price: 30.0,
      imageUrl:
          "https://media.istockphoto.com/id/856917576/photo/formal-shirt-with-button-down-collar-isolated-on-white.jpg?s=612x612&w=0&k=20&c=kcZmZdMFb5I2XkhnyAWCFAZgmxuAh0Kk_bFP_w0Ij5A=",
    ),
    CartItem(
      name: "Sport Dress",
      color: "Black",
      size: "M",
      price: 43.0,
      imageUrl:
          "https://media.istockphoto.com/id/932170474/photo/black-color-formal-shirt-with-button-down-collar-isolated-on-white.jpg?s=612x612&w=0&k=20&c=lSm__n9iotEoEYdPIdfDsSePHF18uI1vl0RLZ26b7cM=",
    ),
  ];

  // Function to calculate the total amount
  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.quantity * item.price));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text("Color: ${item.color}, Size: ${item.size}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            }
                          });
                        },
                      ),
                      Text("${item.quantity}"),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                      Text("\$${item.price.toStringAsFixed(2)}"),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Total amount: \$${totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Congratulations on your purchase!"),
                      ),
                    );
                  },
                  child: Text("CHECK OUT"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
