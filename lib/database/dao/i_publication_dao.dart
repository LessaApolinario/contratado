import 'package:contratado/models/publication.dart';

abstract class IPublicationDAO {
  Future<List<Publication>> findContractorsPublications();
  Future<List<Publication>> findServiceProvidersPublications();
}