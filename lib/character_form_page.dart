import 'package:flutter/material.dart';
import 'firestore_service.dart';
import 'character.dart';

class CharacterFormPage extends StatefulWidget {
  final Character? character;

  const CharacterFormPage({Key? key, this.character}) : super(key: key);

  @override
  State<CharacterFormPage> createState() => _CharacterFormPageState();
}

class _CharacterFormPageState extends State<CharacterFormPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService _service = FirestoreService();

  late TextEditingController _nameController;
  late TextEditingController _animeController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.character?.name ?? '');
    _animeController = TextEditingController(
      text: widget.character?.anime ?? '',
    );
    _imageUrlController = TextEditingController(
      text: widget.character?.imageUrl ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _animeController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newCharacter = Character(
        id: widget.character?.id ?? '',
        name: _nameController.text,
        anime: _animeController.text,
        imageUrl: _imageUrlController.text,
      );

      if (widget.character == null) {
        _service.addCharacter(newCharacter);
      } else {
        _service.updateCharacter(newCharacter);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.character != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Character" : "Add Character"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Character Name"),
                validator: (value) => value!.isEmpty ? "Name required" : null,
              ),
              TextFormField(
                controller: _animeController,
                decoration: InputDecoration(labelText: "Anime"),
                validator: (value) => value!.isEmpty ? "Anime required" : null,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: "Image URL"),
                validator:
                    (value) => value!.isEmpty ? "Image URL required" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(isEditing ? "Update" : "Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
