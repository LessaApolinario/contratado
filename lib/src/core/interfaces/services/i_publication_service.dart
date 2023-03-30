import 'package:contratado/src/core/domain/models/publication.dart';
import 'package:contratado/src/core/interfaces/adapters/publication_adapter.dart';

abstract class IPublicationService {
  PublicationAdapter adapter;

  IPublicationService(this.adapter);

  Future<void> create(Publication publication);

  Future<List<Publication>> find(String key, String value);
}
