import 'package:digital_vision_app/navbar/order.dart';
import 'package:digital_vision_app/products/product.dart';
import 'package:digital_vision_app/navbar/promo.dart';
import 'package:digital_vision_app/navbar/setting.dart';
import 'package:digital_vision_app/navbar/stat.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

int _currentIndex = 1;
List screen = [Product(), OrdersPage(), Promo(), StatPage(), Setting()];

final _kBottomNavBarItem = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produits'),
  BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'commandes'),
  BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'promo'),
  BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'paramettre'),
];

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    assert(screen.length == _kBottomNavBarItem.length);
    final bottomnavBar = BottomNavigationBar(
      items: _kBottomNavBarItem,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: bottomnavBar,
    );
  }
}
