import 'package:flutter/material.dart';

class FiltrePage extends StatefulWidget {
  const FiltrePage({super.key});

  @override
  State<FiltrePage> createState() => _FiltrePageState();
}

class _FiltrePageState extends State<FiltrePage> {
  @override
  Widget build(BuildContext context) {
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Réinitialiser'),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Text('Statut')),
                SizedBox(width: 10),
                Expanded(child: Text('Table')),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(child: Text('Date')),
                SizedBox(width: 10),
                Expanded(child: Text('Montant')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
