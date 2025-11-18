import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_controller.dart';
import '../models/animal_model.dart';
import 'crud_view.dart';
import 'news_view.dart';
import 'profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AnimalsHomePage(),
    const NewsView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2D9),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('WildBite', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Hewan'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class AnimalsHomePage extends StatelessWidget {
  const AnimalsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimalController>(context);
    final animalsMap = controller.allAnimals;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage('assets/images/header.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            'Rekomendasi Makanan Hewan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _foodCard('Pisang (Monyet)', 'assets/images/pisang.jpg'),
                _foodCard('Wortel (Kelinci)', 'assets/images/tel.jpg'),
                _foodCard('Biji (Burung)', 'assets/images/biji.jpg'),
                _foodCard('Ikan (Kucing)', 'assets/images/salmon.jpg'),
                _foodCard('Daging (Anjing)', 'assets/images/daging.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 18),

          ...animalsMap.entries.map((entry) {
            final type = entry.key;
            final list = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AnimalListPage(type: type)),
                      ),
                      child: const Text('Lihat semua'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 300, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    padding: const EdgeInsets.only(right: 12),
                    itemBuilder: (context, index) {
                      final animal = list[index];
                      return _animalCard(context, type, controller, animal, index);
                    },
                  ),
                ),
                const SizedBox(height: 18),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  static Widget _foodCard(String title, String imgPath) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset(
              imgPath,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  height: 90,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.fastfood, size: 36, color: Colors.grey),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.brown)),
          )
        ],
      ),
    );
  }

  Widget _animalCard(BuildContext context, String type, AnimalController controller, Animal animal, int index) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: animal.image.startsWith('http')
                ? Image.network(
                    animal.image,
                    height: 140,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    animal.image,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown)),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      animal.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.orangeAccent),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: 'Favorit',
                  icon: Icon(
                    animal.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.orange,
                  ),
                  onPressed: () => controller.toggleFavorite(type, animal),
                ),
                IconButton(
                  tooltip: 'Edit',
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CrudView(type: type, editAnimal: animal, index: index),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Hapus',
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => controller.deleteAnimal(type, index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalListPage extends StatelessWidget {
  final String type;
  const AnimalListPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimalController>(context);
    final list = controller.getAnimalsByType(type);

    return Scaffold(
      appBar: AppBar(title: Text(type), backgroundColor: Colors.orangeAccent),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CrudView(type: type))),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: list.length,
        itemBuilder: (ctx, i) {
          final animal = list[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: animal.image.startsWith('http')
                        ? Image.network(animal.image, width: 56, height: 56, fit: BoxFit.cover)
                        : Image.asset(animal.image, width: 56, height: 56, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          animal.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Favorit',
                    icon: Icon(
                      animal.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.orange,
                    ),
                    onPressed: () => controller.toggleFavorite(type, animal),
                  ),
                  IconButton(
                    tooltip: 'Edit',
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CrudView(type: type, editAnimal: animal, index: i),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Hapus',
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => controller.deleteAnimal(type, i),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
