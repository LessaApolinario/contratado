import 'package:contratado/interfaces/database/mixins/i_publication_creator_database.dart';
import 'package:contratado/interfaces/database/mixins/i_publication_searcher_database.dart';

abstract class INoSQLDatabase
    with IPublicationCreatorDatabase, IPublicationSearcherDatabase {}
