// import 'package:digital_vision_app/navigation.dart';
// import 'package:flutter/material.dart';

// class OrdersPage extends StatefulWidget {
//   const OrdersPage({Key? key}) : super(key: key);

//   @override
//   State<OrdersPage> createState() => _OrdersPageState();
// }

// class _OrdersPageState extends State<OrdersPage> {
//   bool _showFilters = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Commandes'),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 const Icon(Icons.notifications_none, size: 28),
//                 Positioned(
//                   right: -2,
//                   top: -2,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 4,
//                       vertical: 1,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     constraints: const BoxConstraints(
//                       minWidth: 16,
//                       minHeight: 16,
//                     ),
//                     child: const Text(
//                       '4',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           _buildSearchBar(),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   if (_showFilters) _buildFilters(),
//                   const SizedBox(height: 8),
//                   const Text(
//                     '3 commande',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   _buildOrderCard(),
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Rechercher par nom, commande ou ...',
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: const Color(0xFFF5F6FA),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 _showFilters = !_showFilters;
//               });
//             },
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F6FA),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Icon(Icons.filter_list),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFilters() {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 1,
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Filtres Avancés",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('Réinitialiser'),
//                   ),
//                 ),
//               ],
//             ),
//             const Row(
//               children: [
//                 Expanded(child: Text('Statut')),
//                 SizedBox(width: 10),
//                 Expanded(child: Text('Table')),
//               ],
//             ),
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 Expanded(child: Text('Date')),
//                 SizedBox(width: 10),
//                 Expanded(child: Text('Montant')),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderCard() {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Text(
//                   '#001',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade100,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     'En attente',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   '15.50 €',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Marie Dupont • Table 5',
//               style: TextStyle(color: Colors.grey),
//             ),
//             const Text(
//               '14:30',
//               style: TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Articles:',
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             const Text('2x Bière Blonde, 1x Sandwich Club'),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       'Confirmer',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       side: const BorderSide(color: Colors.red),
//                     ),
//                     child: const Text(
//                       'Refuser',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

enum OrderStatus { pending, confirmed, refused }

class Order {
  final String id;
  final String customer;
  final String table;
  final String time;
  final List<String> items;
  final double amount;
  OrderStatus status;

  Order({
    required this.id,
    required this.customer,
    required this.table,
    required this.time,
    required this.items,
    required this.amount,
    this.status = OrderStatus.pending,
  });
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Order> _orders = [
    Order(
      id: '#001',
      customer: 'Marie Dupont',
      table: 'Table 5',
      time: '14:30',
      items: ['2x Bière Blonde', '1x Sandwich Club'],
      amount: 15.50,
    ),
  ];

  String _searchText = '';
  OrderStatus? _statusFilter = OrderStatus.pending;
  String _tableFilter = 'Toutes';
  String _dateFilter = 'Toutes';
  String _amountFilter = 'Tous';

  final List<String> _tables = ['Toutes', 'Table 1', 'Table 2', 'Table 5'];
  final List<String> _dates = ['Toutes', "Aujourd'hui", 'Hier'];
  final List<String> _amounts = ['Tous', '< 10 €', '10-20 €', '> 20 €'];

  int _selectedBottomIndex = 1;

  bool _showFilters = false; // contrôle l'affichage des filtres
   bool showNotifications = false;

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Nouvelle commande #1234 - Table 5',
      'time': 'Il y a 2 min',
      'color': Colors.blue,
    },
    {
      'title': 'Stock faible: Coca-Cola',
      'time': 'Il y a 5 min',
      'color': Colors.red,
    },
    {
      'title': 'Promotion Happy Hour activée',
      'time': 'Il y a 10 min',
      'color': Colors.green,
    },
    {
      'title': 'Commande #1233 validée',
      'time': 'Il y a 15 min',
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _applyFilters();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior:
                  Clip.none, // important pour que le badge dépasse légèrement
              children: [
                const Icon(Icons.notifications_none, size: 30),
                Positioned(
                  right: -8, // décale légèrement vers l'extérieur
                  top: -10, // décale légèrement vers le haut
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: const Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Icône filtre
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_showFilters) _buildFilters(), // affichage conditionnel
                  const SizedBox(height: 8),
                  Text(
                    '${filteredOrders.length} commandes',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  ...filteredOrders.map((order) => _buildOrderCard(order)),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher par nom, commande ou ...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF5F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => _searchText = value),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              setState(() {
                _showFilters = !_showFilters; // toggle affichage
              });
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filtres Avancés",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _resetFilters,
                    child: const Text('Réinitialiser'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Première ligne =====
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Statut", // 👈 label du premier dropdown
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildStatusDropdown(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Table", // 👈 label du deuxième dropdown
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildTableDropdown(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ===== Deuxième ligne =====
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date", // 👈 label du troisième dropdown
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildDateDropdown(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Montant", // 👈 label du quatrième dropdown
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildAmountDropdown(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return _dropdownWrapper(
      DropdownButton<OrderStatus?>(
        isExpanded: true,
        underline: const SizedBox(),
        value: _statusFilter,
        items: const [
          DropdownMenuItem(value: null, child: Text('Tous')),
          DropdownMenuItem(
            value: OrderStatus.pending,
            child: Text('En attente'),
          ),
          DropdownMenuItem(
            value: OrderStatus.confirmed,
            child: Text('Confirmé'),
          ),
          DropdownMenuItem(value: OrderStatus.refused, child: Text('Refusé')),
        ],
        onChanged: (value) => setState(() => _statusFilter = value),
      ),
    );
  }

  Widget _buildTableDropdown() {
    return _dropdownWrapper(
      DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        value: _tableFilter,
        items: _tables
            .map((t) => DropdownMenuItem(value: t, child: Text(t)))
            .toList(),
        onChanged: (value) => setState(() => _tableFilter = value ?? 'Toutes'),
      ),
    );
  }

  Widget _buildDateDropdown() {
    return _dropdownWrapper(
      DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        value: _dateFilter,
        items: _dates
            .map((d) => DropdownMenuItem(value: d, child: Text(d)))
            .toList(),
        onChanged: (value) => setState(() => _dateFilter = value ?? 'Toutes'),
      ),
    );
  }

  Widget _buildAmountDropdown() {
    return _dropdownWrapper(
      DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        value: _amountFilter,
        items: _amounts
            .map((a) => DropdownMenuItem(value: a, child: Text(a)))
            .toList(),
        onChanged: (value) => setState(() => _amountFilter = value ?? 'Tous'),
      ),
    );
  }

  Widget _dropdownWrapper(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  void _resetFilters() {
    setState(() {
      _statusFilter = OrderStatus.pending;
      _tableFilter = 'Toutes';
      _dateFilter = 'Toutes';
      _amountFilter = 'Tous';
    });
  }

  List<Order> _applyFilters() {
    return _orders.where((order) {
      if (_statusFilter != null && order.status != _statusFilter) return false;
      if (_tableFilter != 'Toutes' && order.table != _tableFilter) return false;
      if (_searchText.isNotEmpty &&
          !order.customer.toLowerCase().contains(_searchText.toLowerCase()) &&
          !order.id.toLowerCase().contains(_searchText.toLowerCase()))
        return false;
      return true;
    }).toList();
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  order.id,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                _buildStatusChip(order.status),
                const Spacer(),
                Text(
                  '${order.amount.toStringAsFixed(2)} €',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${order.customer} • ${order.table}',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              order.time,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            const Text(
              'Articles:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(order.items.join(', ')),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: order.status == OrderStatus.pending
                        ? () => _confirmOrder(order)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: order.status == OrderStatus.pending
                        ? () => _refuseOrder(order)
                        : null,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: order.status == OrderStatus.pending
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                    child: const Text(
                      'Refuser',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(OrderStatus status) {
    Color color;
    String text;

    switch (status) {
      case OrderStatus.pending:
        color = Colors.orange.shade100;
        text = 'En attente';
        break;
      case OrderStatus.confirmed:
        color = Colors.green.shade100;
        text = 'Confirmé';
        break;
      case OrderStatus.refused:
        color = Colors.red.shade100;
        text = 'Refusé';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  void _confirmOrder(Order order) {
    setState(() => order.status = OrderStatus.confirmed);
  }

  void _refuseOrder(Order order) {
    setState(() => order.status = OrderStatus.refused);
  }
}
