import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Commandes",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'serif',
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 25,
          icon: const Icon(Icons.notifications_none_outlined),
        ),
      ],
    );
  }
}
