import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import 'news_add_view.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewsController>(context);

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewsAddView()),
          );
        },
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.news.length,
        itemBuilder: (context, index) {
          final news = controller.news[index];
          final img = news.image;

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            shadowColor: Colors.orange.withOpacity(0.3),

            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: img.startsWith("http")
                      ? Image.network(img,
                          height: 190, width: double.infinity, fit: BoxFit.cover)
                      : Image.asset(img,
                          height: 190, width: double.infinity, fit: BoxFit.cover),
                ),

                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          news.category,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        news.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        news.subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 10),

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.pets, color: Colors.orange),
                            label: const Text(
                              "Baca Selengkapnya",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),

                          
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              controller.deleteNews(news.id);
                            },
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
