import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:snapbut/Providers/cartprovider.dart';
import 'package:snapbut/Screens/cart.dart';


class ViewProduct extends StatefulWidget {
  final String proimg;
  final String proname;
  final String price;
  final String des;

  const ViewProduct({
    super.key,
    required this.proimg,
    required this.proname,
    required this.price,
    required this.des,
  });

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<CartProvider>(context);
    final totalamount = Provider.of<CartProvider>(context);
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.proimg), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(widget.proname,
                          style: const TextStyle(fontSize: 30, letterSpacing: 10)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(widget.price.toString(), style: const TextStyle(fontSize: 27)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 9, right: 9),
                      child: Text(widget.des, style: const TextStyle(fontSize: 25)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Free delivery for above Rs.500",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Expanded(
          child: Row(children: [
            SizedBox(
              height: 60,
              width: 180,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      cartitem.add(widget.proimg);
                      cartitemname.add(widget.proname);
                      cartitemprice.add(widget.price);
                      badge.cartSizeincr();
                      totalamount.totalpriceincr();

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Cart()));
                    });
                  },
                  child: const Text("Add to cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20))),
            ),
            SizedBox(
              height: 60,
              width: 180,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
          ]),
        ));
  }
}
