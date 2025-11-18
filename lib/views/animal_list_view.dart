import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_controller.dart';
import '../models/animal_model.dart';
import 'crud_view.dart';

class AnimalListView extends StatelessWidget {
  final String animalType;
  const AnimalListView({super.key, required this.animalType});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimalController>(context);
    final animals = controller.getAnimalsByType(animalType);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(animalType),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CrudView(type: animalType),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
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
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    animal.image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animal.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF7043),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        animal.description,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              animal.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.orangeAccent,
                            ),
                            onPressed: () =>
                                controller.toggleFavorite(animalType, animal),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.orangeAccent),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CrudView(
                                  type: animalType,
                                  editAnimal: animal,
                                  index: index,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent),
                            onPressed: () =>
                                controller.deleteAnimal(animalType, index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
