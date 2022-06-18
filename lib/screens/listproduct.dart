import 'package:flutter/material.dart';
import 'package:sales_oder/model/product.dart';
import 'package:sales_oder/screens/homepage.dart';
import 'package:sales_oder/screens/widgets/singeproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<Product> snapShot;
  ListProduct({required this.name, required this.snapShot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    scrollDirection: Axis.vertical,
                    children: snapShot
                        .map(
                          (e) => SingleProduct(
                              image: e.image, name: e.name, price: e.price),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
