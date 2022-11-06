import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contratado/interfaces/database/i_nosql_database.dart';

class FirebaseDatabase implements INoSQLDatabase {
  late CollectionReference _collection;

  FirebaseDatabase(CollectionReference collection) {
    _collection = collection;
  }

  @override
  Future<void> createContractorPublication(Map<String, dynamic> data) async {
    await _collection.add({
      "username": data["username"],
      "user_type": data["user_type"],
      "description": data["description"],
      "email": data["email"],
      "user_description": data["user_description"],
    });
  }

  @override
  Future<void> createServiceProviderPublication(
      Map<String, dynamic> data) async {
    await _collection.add({
      "username": data["username"],
      "user_type": data["user_type"],
      "description": data["description"],
      "phone": data["phone"],
      "email": data["email"],
      "user_description": data["user_description"],
    });
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>>
      findContractorsPublications() async {
    QuerySnapshot querySnapshot = await _collection.get();

    final contractorsPublications = querySnapshot.docs
        .where((element) => element["user_type"] == "contratante")
        .toList();

    return contractorsPublications;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>>
      findServiceProvidersPublications() async {
    QuerySnapshot querySnapshot = await _collection.get();

    final serviceProvidersPublications = querySnapshot.docs
        .where((element) => element["user_type"] == "prestador de serviço")
        .toList();

    return serviceProvidersPublications;
  }
}
