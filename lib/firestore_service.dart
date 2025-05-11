import 'package:cloud_firestore/cloud_firestore.dart';
import 'character.dart';

class FirestoreService {
  final CollectionReference characters = FirebaseFirestore.instance.collection(
    'characters',
  );

  Future<void> addCharacter(Character character) async {
    await characters.add(character.toMap());
  }

  Stream<List<Character>> getCharacters() {
    return characters.snapshots().map(
      (snapshot) =>
          snapshot.docs
              .map(
                (doc) => Character.fromMap(
                  doc.id,
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  Future<void> updateCharacter(Character character) async {
    await characters.doc(character.id).update(character.toMap());
  }

  Future<void> deleteCharacter(String id) async {
    await characters.doc(id).delete();
  }
}
