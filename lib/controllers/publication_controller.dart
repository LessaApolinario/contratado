import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contratado/database/firebase_database.dart';
import 'package:contratado/interfaces/database/i_nosql_database.dart';
import 'package:contratado/interfaces/repositories/i_publication_repository.dart';
import 'package:contratado/interfaces/services/i_publication_service.dart';
import 'package:contratado/models/publication.dart';
import 'package:contratado/repositories/publication_repository.dart';
import 'package:contratado/services/publication_service.dart';

class PublicationController {
  late CollectionReference _publications;

  PublicationController(CollectionReference publications) {
    _publications = publications;
  }

  Future<void> createContractorPublication(Publication publication) async {
    INoSQLDatabase database = FirebaseDatabase(_publications);
    IPublicationRepository publicationRepository =
        PublicationRepository(database);
    IPublicationService publicationService =
        PublicationService(publicationRepository);

    await publicationService.createContractorPublication(publication);
  }

  Future<void> createServiceProviderPublication(Publication publication) async {
    INoSQLDatabase database = FirebaseDatabase(_publications);
    IPublicationRepository publicationRepository =
        PublicationRepository(database);
    IPublicationService publicationService =
        PublicationService(publicationRepository);

    await publicationService.createServiceProviderPublication(publication);
  }

  Future<List<Publication>> findContractorsPublications() async {
    INoSQLDatabase database = FirebaseDatabase(_publications);
    IPublicationRepository publicationRepository =
        PublicationRepository(database);
    IPublicationService publicationService =
        PublicationService(publicationRepository);

    return await publicationService.findContractorsPublications();
  }

  Future<List<Publication>> findServiceProvidersPublications() async {
    INoSQLDatabase database = FirebaseDatabase(_publications);
    IPublicationRepository publicationRepository =
        PublicationRepository(database);
    IPublicationService publicationService =
        PublicationService(publicationRepository);

    return await publicationService.findServiceProvidersPublications();
  }
}
