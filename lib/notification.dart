import 'package:flutter/material.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool showNotifications = false;

  // Exemple de notifications
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
    return Stack(
      children: [
        // Icône de notification
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            setState(() {
              showNotifications = !showNotifications;
            });
          },
        ),

        // Badge rouge avec le nombre
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
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
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

        // Popup des notifications
        if (showNotifications)
          Positioned(
            right: 0,
            top: 50,
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
                    // Titre
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

                    // Liste des notifications
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

                    // Bouton "Marquer tout comme lu"
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
    );
  }
}
