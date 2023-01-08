import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [const Icon(Icons.shopping_cart), Badge(
      showBadge: true,
    )]);
  }
}


