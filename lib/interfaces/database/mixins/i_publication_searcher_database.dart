import 'package:cloud_firestore/cloud_firestore.dart';

mixin IPublicationSearcherDatabase {
  Future<List<QueryDocumentSnapshot<Object?>>> findContractorsPublications();

  Future<List<QueryDocumentSnapshot<Object?>>>
      findServiceProvidersPublications();
}
