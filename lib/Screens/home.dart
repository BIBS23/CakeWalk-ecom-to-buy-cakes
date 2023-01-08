import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapbut/Providers/cartprovider.dart';
import 'package:snapbut/Screens/cart.dart';
import 'package:snapbut/Screens/viewprod.dart';
import 'package:snapbut/utils/prolist.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<CartProvider>(context);
    final count = badge.count;
    return 
         Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Snap Buy",
                    style: TextStyle(letterSpacing: 10),
                  ),
                  centerTitle: true,
                  actions: [
                    Stack(
                      children: [

                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Cart()));
                          },
                          icon: const Icon(Icons.shopping_cart),
                        ),
                        Positioned(
                          left: 25,
                          top: 5,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child:
                            Center(
                                child: Text(
                                '$count',
                              style: const TextStyle(fontSize: 10),
                            )),
                          
                        ),
                    )],
                    ),
                  ],
                ),
                body: GridView.builder(
                    itemCount: ProList.prodetails.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 260,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      ProList p = ProList.prodetails[index];
                      return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        p.proimg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(p.proname,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.9),
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 3,
                                        )),
                                    Text(p.price,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.9),
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 3,
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text("Delivery Available",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.9),
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 3,
                                          )),
                                    ),
                                  ]),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewProduct(
                                      proimg: p.proimg,
                                      proname: p.proname,
                                      price: p.price,
                                      des: p.details),
                                ));
                          });
                    }));
  }
}
    


