import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_controller.dart';
import '../models/animal_model.dart';

class CrudView extends StatefulWidget {
  final String type;
  final Animal? editAnimal;
  final int? index;

  const CrudView({
    super.key,
    required this.type,
    this.editAnimal,
    this.index,
  });

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _imgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editAnimal != null) {
      _nameController.text = widget.editAnimal!.name;
      _descController.text = widget.editAnimal!.description;
      _imgController.text = widget.editAnimal!.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimalController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(widget.editAnimal == null
            ? 'Tambah ${widget.type}'
            : 'Edit ${widget.type}'),
        centerTitle: true,

        // ✅ Tambahkan tombol BACK di sini
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Hewan',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Deskripsi wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _imgController,
                decoration: const InputDecoration(
                  labelText: 'Path atau URL Gambar',
                  hintText: 'Contoh: assets/images/monkey1.jpg',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 20),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.editAnimal == null) {
                      // Tambah data baru
                      final newAnimal = Animal.create(
                        name: _nameController.text,
                        image: _imgController.text.isEmpty
                            ? 'assets/images/default.jpg'
                            : _imgController.text,
                        description: _descController.text,
                        type: widget.type,
                      );
                      controller.addAnimal(widget.type, newAnimal);
                    } else {
                      // Update data lama
                      final updatedAnimal = Animal(
                        id: widget.editAnimal!.id,
                        name: _nameController.text,
                        image: _imgController.text.isEmpty
                            ? 'assets/images/default.jpg'
                            : _imgController.text,
                        description: _descController.text,
                        type: widget.type,
                        isFavorite: widget.editAnimal!.isFavorite,
                      );
                      controller.updateAnimal(
                          widget.type, widget.index!, updatedAnimal);
                    }

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
