import 'package:contratado/src/core/domain/models/publication.dart';
import 'package:contratado/src/core/interfaces/services/i_publication_service.dart';

class PublicationService extends IPublicationService {
  PublicationService(super.adapter);

  @override
  Future<void> create(Publication publication) {
    return adapter.create(publication);
  }

  @override
  Future<List<Publication>> find(String key, String value) {
    return adapter.find(key, value);
  }
}
