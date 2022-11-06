import 'package:contratado/interfaces/repositories/i_publication_repository.dart';
import 'package:contratado/interfaces/services/i_publication_service.dart';
import 'package:contratado/models/publication.dart';

class PublicationService implements IPublicationService {
  late IPublicationRepository _publicationRepository;

  PublicationService(IPublicationRepository publicationRepository) {
    _publicationRepository = publicationRepository;
  }

  @override
  Future<void> createContractorPublication(Publication publication) async {
    await _publicationRepository.createContractorPublication(publication);
  }

  @override
  Future<void> createServiceProviderPublication(Publication publication) async {
    await _publicationRepository.createServiceProviderPublication(publication);
  }

  @override
  Future<List<Publication>> findContractorsPublications() async {
    return await _publicationRepository.findContractorsPublications();
  }

  @override
  Future<List<Publication>> findServiceProvidersPublications() async {
    return await _publicationRepository.findServiceProvidersPublications();
  }
}
