import 'package:flutter/material.dart';

class Promo extends StatefulWidget {
  const Promo({super.key});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  String selectedProduit = "Bière Blonde - 4.5€";
  String selectedTypePromo = "Prix réduit";
  String selectedTypeReduction = "Pourcentage (%)";

  TextEditingController reductionController = TextEditingController(text: "20");

  DateTime dateDebut = DateTime(2024, 1, 15);
  DateTime dateFin = DateTime(2024, 2, 15);
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
    return GestureDetector(
      // Fermer le popup si on clique ailleurs
      onTap: () {
        if (showNotifications) {
          setState(() {
            showNotifications = false;
          });
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // === Contenu principal ===
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    AppBar(
                      title: const Text(
                        'Promotions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      actions: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  showNotifications = !showNotifications;
                                });
                              },
                            ),
                            if (notifications.isNotEmpty)
                              Positioned(
                                right: 6,
                                top: 6,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Text(
                                    '${notifications.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),

                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                        elevation: 3,
                      ),
                      onPressed: _showAddPromoDialog,
                      child: const Text(
                        "+ Ajouter une Promotion",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Exemple de carte promo
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Bière Blonde',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Active',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.pause,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(135, 33, 194, 243),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                '% Prix réduit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '20% de réduction',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('2x Bière Blonde, 1x Sandwich Club'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // === Popup Notifications (en haut à droite) ===
            if (showNotifications)
              Positioned(
                right: 10,
                top: kToolbarHeight + 10,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    constraints: const BoxConstraints(maxHeight: 350),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Divider(height: 1),
                        if (notifications.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.notifications_off,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Vous n'avez pas de notifications",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: notifications.length,
                              itemBuilder: (context, index) {
                                final notif = notifications[index];
                                return ListTile(
                                  leading: Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: notif['color'],
                                  ),
                                  title: Text(notif['title']),
                                  subtitle: Text(
                                    notif['time'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        const Divider(height: 1),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              notifications.clear();
                              showNotifications = false;
                            });
                          },
                          child: const Text(
                            "Marquer tout comme lu",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // === Fenêtre d’ajout ou modification ===
  void _showAddPromoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Modifier la promotion",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("Produit concerné"),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: selectedProduit,
                      items: const [
                        DropdownMenuItem(
                          value: "Bière Blonde - 4.5€",
                          child: Text("Bière Blonde - 4.5€"),
                        ),
                        DropdownMenuItem(
                          value: "Sandwich Club - 6€",
                          child: Text("Sandwich Club - 6€"),
                        ),
                      ],
                      onChanged: (v) => setState(() => selectedProduit = v!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("Valeur de la réduction"),
                    const SizedBox(height: 6),
                    TextField(
                      controller: reductionController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: selectedTypeReduction == "Pourcentage (%)"
                            ? "%"
                            : "€",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Annuler"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Modifier",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
