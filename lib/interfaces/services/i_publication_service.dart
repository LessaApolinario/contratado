import 'package:contratado/models/publication.dart';

abstract class IPublicationService {
  Future<void> createContractorPublication(Publication publication);

  Future<void> createServiceProviderPublication(Publication publication);

  Future<List<Publication>> findContractorsPublications();

  Future<List<Publication>> findServiceProvidersPublications();
}
