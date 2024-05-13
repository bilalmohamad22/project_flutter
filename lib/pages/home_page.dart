import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';
import '../setings_page/setings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => setings(),
                  ));
            },
            icon: Icon(
              Icons.settings,
              size: 40,
            ),
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'kelar, iraq',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false)
                      .addItemToShopItems([
                    "apple product",
                    "?....",
                    "assets/images/apple.jpg",
                    // Colors.brown
                  ]);
                },
                icon: Icon(Icons.add),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 88, 88, 104),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Container(
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),

                  // good morning bro
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('Good morning,'),
                  ),

                  const SizedBox(height: 4),

                  // Let's order fresh items for you
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Let's order items for you",
                      style: GoogleFonts.notoSerif(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(),
                  ),

                  const SizedBox(height: 24),

                  // categories -> horizontal listview
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Recent Items",
                      style: GoogleFonts.notoSerif(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  // recent orders -> show last 3
                  Expanded(
                    child: Consumer<CartModel>(
                      builder: (context, value, child) {
                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(12),
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.shopItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.2,
                          ),
                          itemBuilder: (context, index) {
                            return GroceryItemTile(
                              itemName: value.shopItems[index][0],
                              itemPrice: value.shopItems[index][1],
                              imagePath: value.shopItems[index][2],
                              // color: value.shopItems[index][3],
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(index),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
