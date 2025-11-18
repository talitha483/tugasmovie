import 'package:flutter/foundation.dart';
import '../models/animal_model.dart';

class AnimalController extends ChangeNotifier {
  final Map<String, List<Animal>> _animals = {
  'Anjing': [
    Animal(
      id: '1',
      name: 'Golden Retriever',
      image: 'assets/images/golden.jpg',
      description: 'Anjing ramah dan cerdas.',
      type: 'Anjing',
    ),
    Animal(
      id: '2',
      name: 'Bulldog',
      image: 'assets/images/buldog.jpg',
      description: 'Santai dan penyayang.',
      type: 'Anjing',
    ),
    Animal(
      id: '3',
      name: 'Husky',
      image: 'assets/images/husky.jpg',
      description: 'Tegas dan penuh energi.',
      type: 'Anjing',
    ),
  ],

  'Kucing': [
    Animal(
      id: '4',
      name: 'Kucing Persia',
      image: 'assets/images/persia.jpg',
      description: 'Berbulu panjang dan lembut.',
      type: 'Kucing',
    ),
    Animal(
      id: '5',
      name: 'Kucing Anggora',
      image: 'assets/images/anggora.jpg',
      description: 'Aktif dan lucu.',
      type: 'Kucing',
    ),
    Animal(
      id: '6',
      name: 'Kucing Siam',
      image: 'assets/images/salm.jpg',
      description: 'Cerdas dan suka bersosialisasi.',
      type: 'Kucing',
    ),
  ],

  'Monyet': [
    Animal(
      id: '7',
      name: 'Monyet Emas',
      image: 'assets/images/emas.jpg',
      description: 'Langka dan berwarna keemasan.',
      type: 'Monyet',
    ),
    Animal(
      id: '8',
      name: 'Mandrill',
      image: 'assets/images/madril.jpg',
      description: 'Wajah berwarna-warni.',
      type: 'Monyet',
    ),
    Animal(
      id: '9',
      name: 'Capuchin',
      image: 'assets/images/cpc.jpg',
      description: 'Cerdas dan sosial.',
      type: 'Monyet',
    ),
  ],

  'Kelinci': [
    Animal(
      id: '10',
      name: 'Kelinci Netherland Dwarf',
      image: 'assets/images/land.jpg',
      description: 'Kelinci kecil, lucu, dan aktif.',
      type: 'Kelinci',
    ),
    Animal(
      id: '11',
      name: 'Kelinci Lop',
      image: 'assets/images/lop.jpg',
      description: 'Telinganya panjang menjuntai.',
      type: 'Kelinci',
    ),
    Animal(
      id: '12',
      name: 'Kelinci Flemish Giant',
      image: 'assets/images/giant.jpg',
      description: 'Berukuran besar dan lembut.',
      type: 'Kelinci',
    ),
  ],

  'Burung': [
    Animal(
      id: '13',
      name: 'Burung Kenari',
      image: 'assets/images/kenari.jpg',
      description: 'Kicauannya merdu dan lembut.',
      type: 'Burung',
    ),  
    Animal(
      id: '14',
      name: 'Burung Lovebird',
      image: 'assets/images/Lovebird.jpg',
      description: 'Aktif, ceria, dan penuh warna.',
      type: 'Burung',
    ),
    Animal(
      id: '15',
      name: 'Burung Kakaktua',
      image: 'assets/images/kakaktua.jpg',
      description: 'Cerdas dan bisa meniru suara.',
      type: 'Burung',
    ),
  ],
};


  Map<String, List<Animal>> get allAnimals => _animals;

  List<Animal> getAnimalsByType(String type) {
    return _animals[type] ?? [];
  }

  void addAnimal(String type, Animal animal) {
    _animals[type] ??= [];
    _animals[type]!.add(animal);
    notifyListeners();
  }

  void updateAnimal(String type, int index, Animal updatedAnimal) {
    if (_animals[type] != null && index < _animals[type]!.length) {
      _animals[type]![index] = updatedAnimal;
      notifyListeners();
    }
  }

  void deleteAnimal(String type, int index) {
    _animals[type]?.removeAt(index);
    notifyListeners();
  }

  void toggleFavorite(String type, Animal animal) {
    animal.isFavorite = !animal.isFavorite;
    notifyListeners();
  }
}
