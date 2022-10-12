import 'package:contratado/database/dao/i_publication_dao.dart';
import 'package:contratado/database/i_database.dart';
import 'package:contratado/models/publication.dart';

class PublicationDAO implements IPublicationDAO {
  late IDatabase _database;

  PublicationDAO(IDatabase database) {
    _database = database;
  }
  
  @override
  Future<List<Publication>> findContractorsPublications() async {
    List<Publication> publications = <Publication>[];
    final result = await _database.findContractorsPublications();

    for (var json in result) {
      Publication publication= Publication.fromJson(json);
      publications.add(publication);
    }

    return publications;
  }
  
  @override
  Future<List<Publication>> findServiceProvidersPublications() async {
    List<Publication> publications = <Publication>[];
    final result = await _database.findServiceProvidersPublications();

    for (var json in result) {
      Publication publication= Publication.fromJson(json);
      publications.add(publication);
    }

    return publications;
  }

}
