import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_controller.dart';
import '../models/news_model.dart';

class NewsAddView extends StatefulWidget {
  const NewsAddView({super.key});

  @override
  State<NewsAddView> createState() => _NewsAddViewState();
}

class _NewsAddViewState extends State<NewsAddView> {
  final titleC = TextEditingController();
  final subtitleC = TextEditingController();
  final categoryC = TextEditingController();
  final imageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Berita"),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(labelText: "Judul Berita"),
            ),

            TextField(
              controller: subtitleC,
              decoration: const InputDecoration(labelText: "Sub Judul"),
            ),

            TextField(
              controller: categoryC,
              decoration: const InputDecoration(labelText: "Kategori"),
            ),

            TextField(
              controller: imageC,
              decoration: const InputDecoration(
                labelText: "URL / Asset Gambar (contoh: https:// atau assets/images/...)",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text("Simpan Berita"),
              onPressed: () {
                controller.addNews(
                  NewsModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleC.text,
                    subtitle: subtitleC.text,
                    category: categoryC.text,
                    image: imageC.text,
                  ),
                );

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
