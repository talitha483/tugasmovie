import 'package:flutter/material.dart';
import '../models/animal_model.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onLove;

  const AnimalCard({
    super.key,
    required this.animal,
    required this.onEdit,
    required this.onDelete,
    required this.onLove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade100,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              animal.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(animal.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                const SizedBox(height: 6),
                Text(animal.description,
                    style: TextStyle(color: Colors.grey.shade700)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        animal.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.orange,
                      ),
                      onPressed: onLove,
                    ),
                    IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: onEdit),
                    IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: onDelete),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
