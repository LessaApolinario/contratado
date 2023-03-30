import 'package:contratado/src/core/domain/models/publication.dart';

abstract class PublicationAdapter {
  Future<void> create(Publication publication);

  Future<List<Publication>> find(String key, String value);
}
