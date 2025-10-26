import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

enum OrderStatus { pending, confirmed, refused }

class _ProductState extends State<Product> {
  bool _showFilters = false;
  OrderStatus? _statusFilter;
  String? _tableFilter;
  String? _dateFilter;
  String? _amountFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text('Produits'),
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Stack(
                  clipBehavior: Clip
                      .none, // important pour que le badge dépasse légèrement
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
          _buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  if (_showFilters) _buildFilters(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          '3 produits',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      _bottomSheet(context);
                    },
                    child: const Text(
                      "+ Ajouter un produit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'image/freepik_assistant_1756911135386.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 8),

                                      // ✅ Ajout de Expanded ici
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Biére blonde',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow
                                                  .ellipsis, // évite le débordement
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              "4.50€",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Stock : ",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  "24",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 6),
                                            Wrap(
                                              spacing:
                                                  10, // espace horizontal entre les éléments
                                              runSpacing:
                                                  6, // espace vertical si ça passe à la ligne
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                      98,
                                                      68,
                                                      137,
                                                      255,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: const Text(
                                                    "Bière",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                      117,
                                                      105,
                                                      240,
                                                      175,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: const Text(
                                                    "Disponible",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 20,
                                right: 15,
                                child: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                    size: 24,
                                  ),
                                  onSelected: (String value) {
                                    setState(() {
                                      if (value == 'edit') {
                                        // Modifier
                                      } else if (value == 'delete') {
                                        // Supprimer
                                      } else if (value == 'details') {
                                        // Détails
                                      }
                                    });
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit, color: Colors.blue),
                                          SizedBox(width: 8),
                                          Text('Modifier'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete, color: Colors.red),
                                          SizedBox(width: 8),
                                          Text('Supprimer'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'details',
                                      child: Row(
                                        children: [
                                          Icon(Icons.info, color: Colors.grey),
                                          SizedBox(width: 8),
                                          Text('Détails'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              setState(() {
                _showFilters = !_showFilters;
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
                const Text(
                  "Filtres Avancés",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _statusFilter = null;
                      _tableFilter = null;
                      _dateFilter = null;
                      _amountFilter = null;
                    });
                  },
                  child: const Text('Réinitialiser'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Première ligne : Statut & Table
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Statut"),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<OrderStatus?>(
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
                            DropdownMenuItem(
                              value: OrderStatus.refused,
                              child: Text('Refusé'),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _statusFilter = value),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Table"),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: _tableFilter,
                          items: const [
                            DropdownMenuItem(
                              value: null,
                              child: Text('Toutes'),
                            ),
                            DropdownMenuItem(
                              value: '1',
                              child: Text('Table 1'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('Table 2'),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text('Table 3'),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _tableFilter = value),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Deuxième ligne : Date & Montant
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Date"),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: _dateFilter,
                          items: const [
                            DropdownMenuItem(
                              value: null,
                              child: Text('Toutes'),
                            ),
                            DropdownMenuItem(
                              value: 'today',
                              child: Text("Aujourd'hui"),
                            ),
                            DropdownMenuItem(
                              value: 'week',
                              child: Text("Cette semaine"),
                            ),
                            DropdownMenuItem(
                              value: 'month',
                              child: Text("Ce mois"),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _dateFilter = value),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Montant"),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: _amountFilter,
                          items: const [
                            DropdownMenuItem(value: null, child: Text('Tous')),
                            DropdownMenuItem(
                              value: '0-50',
                              child: Text('0 - 50 €'),
                            ),
                            DropdownMenuItem(
                              value: '50-100',
                              child: Text('50 - 100 €'),
                            ),
                            DropdownMenuItem(
                              value: '+100',
                              child: Text('+100 €'),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _amountFilter = value),
                        ),
                      ),
                    ],
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

void _bottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // permet au contenu de s'adapter à la hauteur
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext bc) {
      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nouveau produit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom du produit',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Prix (€)',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Stock initial',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description (optionnel)',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Boutons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: const Text(
                      "Annuler",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Ajouter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
