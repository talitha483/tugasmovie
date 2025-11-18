import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsController extends ChangeNotifier {
  List<NewsModel> news = [
    NewsModel(
      id: "1",
      title: "Kucing Lebih Sehat dengan Ikan Segar",
      subtitle:
          "Kucing membutuhkan protein tinggi dari ikan segar untuk menjaga kesehatan bulunya.",
      image: "assets/images/cat_makan.jpg",
      category: "Tips Makanan",
    ),
    NewsModel(
      id: "2",
      title: "Pola Hidup Sosial Burung yang Unik",
      subtitle:
          "Burung dikenal suka hidup berkelompok dan saling melindungi dari predator.",
      image: "assets/images/burungg.jpg",
      category: "Fakta Hewan",
    ),
    NewsModel(
      id: "3",
      title: "Wortel, Rahasia Kelinci Tetap Energik",
      subtitle:
          "Kaya vitamin A, wortel menjadi makanan favorit kelinci yang menyehatkan mata.",
      image: "assets/images/kelincii.jpg",
      category: "Makanan Sehat",
    ),
    NewsModel(
      id: "4",
      title: "Anjing Butuh Asupan Daging Berkualitas",
      subtitle:
          "Daging merah memberikan energi dan memperkuat otot anjing peliharaan.",
      image: "assets/images/jing.jpg",
      category: "Tips Nutrisi",
    ),
    NewsModel(
      id: "5",
      title: "Monyet Hutan dan Pisang Alami",
      subtitle:
          "Pisang membantu monyet menjaga keseimbangan energi saat berpindah dari satu pohon ke pohon lain.",
      image: "assets/images/nyet.jpg",
      category: "Fakta Alam",
    ),
  ];

  
  void addNews(NewsModel data) {
    news.add(data);
    notifyListeners();
  }

  
  void deleteNews(String id) {
    news.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
