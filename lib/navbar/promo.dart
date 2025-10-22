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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Promotions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_none, size: 30),
                Positioned(
                  right: -8,
                  top: -10,
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
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 15),
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
                          const Text(
                            'Bière Blonde',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
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
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.pause, color: Colors.orange),
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
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre
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

                // Produit concerné
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

                // Type de promotion
                const Text("Type de promotion"),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Prix réduit"),
                        selected: selectedTypePromo == "Prix réduit",
                        onSelected: (_) =>
                            setState(() => selectedTypePromo = "Prix réduit"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Offre spéciale"),
                        selected: selectedTypePromo == "Offre spéciale",
                        onSelected: (_) => setState(
                          () => selectedTypePromo = "Offre spéciale",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Type de réduction
                const Text("Type de réduction"),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: selectedTypeReduction,
                  items: const [
                    DropdownMenuItem(
                      value: "Pourcentage (%)",
                      child: Text("Pourcentage (%)"),
                    ),
                    DropdownMenuItem(
                      value: "Montant (€)",
                      child: Text("Montant (€)"),
                    ),
                  ],
                  onChanged: (v) => setState(() => selectedTypeReduction = v!),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Valeur réduction
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
                const SizedBox(height: 16),

                // Dates
                const Text("Date de début"),
                const SizedBox(height: 6),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text:
                        "${dateDebut.day}/${dateDebut.month}/${dateDebut.year}",
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: dateDebut,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2026),
                    );
                    if (picked != null) setState(() => dateDebut = picked);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Date de fin"),
                const SizedBox(height: 6),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: "${dateFin.day}/${dateFin.month}/${dateFin.year}",
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: dateFin,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2026),
                    );
                    if (picked != null) setState(() => dateFin = picked);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 24),

                // Boutons
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
          ),
        );
      },
    );
  }
}
