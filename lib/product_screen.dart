import 'package:flutter/material.dart';
// Pastikan untuk mengganti dengan import halaman detail produk
import 'product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  // List of products with image paths and names
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'image': 'assets/images/product1.png',
      'price': 'Rp9.000.000',
    },
    {
      'name': 'Product 2',
      'image': 'assets/images/product2.png',
      'price': 'Rp9.000.000',
    },
    {
      'name': 'Product 3',
      'image': 'assets/images/product3.png',
      'price': 'Rp9.000.000',
    },
    {
      'name': 'Product 4',
      'image': 'assets/images/product4.png',
      'price': 'Rp9.000.000',
    },
    {
      'name': 'Product 5',
      'image': 'assets/images/product5.png',
      'price': 'Rp9.000.000',
    },
    {
      'name': 'Product 6',
      'image': 'assets/images/product6.png',
      'price': 'Rp9.000.000',
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Stack(
        children: [
          Column(
            children: [
              // AppBar
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        // Handle menu button press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.black),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                  ],
                ),
              ),

              // Title "Products" positioned on the left
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Expanded Grid of Products
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75, // Aspect ratio for containers
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to ProductDetailScreen on tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                productName: products[index]['name']!,
                                productImage: products[index]['image']!,
                                productPrice: products[index]['price']!,
                              ),
                            ),
                          );
                        },
                        child: ProductTile(
                          name: products[index]['name']!,
                          imagePath: products[index]['image']!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Floating Cart Icon
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Handle cart button press
              },
              backgroundColor: Colors.white,
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.grey, // Border color
                  width: 2.0,
                ),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black, // Icon color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final String imagePath;

  const ProductTile({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
