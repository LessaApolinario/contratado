import 'package:contratado/models/publication.dart';

abstract class IPublicationRepository {
  Future<void> createContractorsPublications(Publication publication);

  Future<void> createServiceProvidersPublications(Publication publication);

  Future<List<Publication>> findContractorsPublications();

  Future<List<Publication>> findServiceProvidersPublications();
}
