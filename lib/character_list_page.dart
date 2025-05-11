import 'package:flutter/material.dart';
import 'firestore_service.dart';
import 'character.dart';
import 'character_form_page.dart';

class CharacterListPage extends StatelessWidget {
  final FirestoreService service = FirestoreService();

  CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anime Characters")),
      body: StreamBuilder<List<Character>>(
        stream: service.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final char = characters[index];
                return ListTile(
                  leading:
                      char.imageUrl.isNotEmpty
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(char.imageUrl),
                            onBackgroundImageError: (exception, stackTrace) {
                              debugPrint('Image load error: $exception');
                            },
                          )
                          : const CircleAvatar(child: Icon(Icons.broken_image)),
                  title: Text(char.name),
                  subtitle: Text("From: ${char.anime}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => CharacterFormPage(character: char),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => service.deleteCharacter(char.id),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CharacterFormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
