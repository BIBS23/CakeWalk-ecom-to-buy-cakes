import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapbut/Providers/cartprovider.dart';

List cartitem = [];
List cartitemname = [];
List cartitemprice = [];

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<CartProvider>(context);
    final totalamount = Provider.of<CartProvider>(context);
    final amount = totalamount.total;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(letterSpacing: 10),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cartitem.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cartitem[index],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                cartitemname[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                cartitemprice[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.grey.withOpacity(0.5))),
                                    onPressed: () {
                                      setState(() {
                                        badge.cartSizedecr();
                                        cartitemname.removeAt(index);
                                        cartitem.removeAt(index);
                                        cartitemprice.removeAt(index);
                                        totalamount.totalpricedecr();
                                      });
                                    },
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
              height: 60,
              width: 180,
              child: Center(
                child: Text(
                  amount.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              )),
          SizedBox(
            height: 60,
            width: 180,
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)),
              child: const Text(
                "Place Order",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
