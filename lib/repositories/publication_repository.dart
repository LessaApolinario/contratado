import 'package:contratado/interfaces/database/i_nosql_database.dart';
import 'package:contratado/interfaces/repositories/i_publication_repository.dart';
import 'package:contratado/models/publication.dart';

class PublicationRepository implements IPublicationRepository {
  late INoSQLDatabase _database;

  PublicationRepository(INoSQLDatabase database) {
    _database = database;
  }

  @override
  Future<void> createContractorPublication(Publication publication) async {
    await _database.createContractorPublication(publication.toJson());
  }

  @override
  Future<void> createServiceProviderPublication(Publication publication) async {
    await _database.createServiceProviderPublication(publication.toJson());
  }

  @override
  Future<List<Publication>> findContractorsPublications() async {
    List<Publication> publications = <Publication>[];
    final contractorsPublications =
        await _database.findContractorsPublications();

    for (var document in contractorsPublications) {
      Publication publication = Publication(
        username: document["username"],
        userType: document["user_type"],
        description: document["description"],
        email: document["email"],
        userDescription: document["user_description"],
      );

      publications.add(publication);
    }

    return publications;
  }

  @override
  Future<List<Publication>> findServiceProvidersPublications() async {
    List<Publication> publications = <Publication>[];

    final serviceProvidersPublications =
        await _database.findServiceProvidersPublications();

    for (var document in serviceProvidersPublications) {
      Publication publication = Publication(
        username: document["username"],
        userType: document["user_type"],
        description: document["description"],
        phone: document["phone"],
        email: document["email"],
        userDescription: document["user_description"],
      );

      publications.add(publication);
    }

    return publications;
  }
}
