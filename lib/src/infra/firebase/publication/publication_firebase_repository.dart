import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contratado/src/core/domain/models/publication.dart';
import 'package:contratado/src/core/interfaces/adapters/publication_adapter.dart';

class PublicationFirebaseRepository implements PublicationAdapter {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection("publications");

  @override
  Future<void> create(Publication publication) async {
    await _collection.add(publication.toJson());
  }

  @override
  Future<List<Publication>> find(String key, String value) async {
    QuerySnapshot querySnapshot = await _collection.get();
    final documents =
        querySnapshot.docs.where((doc) => doc[key] == value).toList();
    final products =
        documents.map((document) => document.data() as Publication).toList();
    return products;
  }
}
