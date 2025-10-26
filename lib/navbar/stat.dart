import 'package:flutter/material.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
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
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: const Text(
                  'Statistique',
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
                        icon: const Icon(Icons.notifications_none, size: 30),
                        onPressed: () {
                          setState(() {
                            showNotifications = !showNotifications;
                          });
                        },
                      ),
                      // Badge rouge
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
              SizedBox(height: 20),
              const Expanded(child: StatBody()),
            ],
          ),

          // --- Carte des notifications ---
          if (showNotifications)
            Positioned(
              right: 10,
              top: kToolbarHeight + 20,
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

                      // --- Si aucune notification ---
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
                        Expanded(
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
                                title: Text(
                                  notif['title'],
                                  style: const TextStyle(fontSize: 14),
                                ),
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
    );
  }
}

class StatBody extends StatelessWidget {
  const StatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // === Statistiques principales ===
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.receipt_long,
                  color: Colors.blue.shade50,
                  title: "Commandes",
                  value: "${20.50}\$",
                  subtitle: "Aujourd'hui",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(
                  icon: Icons.attach_money,
                  color: Colors.green.shade50,
                  title: "Revenus",
                  value: "",
                  subtitle: "Aujourd'hui",
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.calendar_today,
                  color: Colors.purple.shade50,
                  title: "Semaine",
                  value: "20.9",
                  subtitle: "7 derniers jours",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(
                  icon: Icons.warning_amber_rounded,
                  color: Colors.orange.shade50,
                  title: "Stock bas",
                  value: "10",
                  subtitle: "Produits",
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // === Produits les plus vendus ===
          const Text(
            "🏆 Produits les plus vendus",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Nom du produit",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "— €",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "— vendus",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),

          const SizedBox(height: 25),

          // === Alertes stock bas ===
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "⚠️ Alertes stock bas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                ...List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nom du produit"),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Rupture",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;
  final String subtitle;

  const _StatCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Icône + titre (texte qui s'adapte)
              Row(
                children: [
                  Icon(icon, color: Colors.black54, size: 22),
                  const SizedBox(width: 6),
                  // Le texte s’adapte à la largeur disponible
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis, // coupe si trop long
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // ✅ Valeur — centrée, sans overflow
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value.isEmpty ? "—" : value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              // ✅ Sous-titre — petit texte qui s’adapte
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
