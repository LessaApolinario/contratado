import 'package:contratado/interfaces/database/mixins/i_access_database.dart';
import 'package:contratado/interfaces/database/mixins/i_register_database.dart';
import 'package:contratado/interfaces/database/mixins/i_session_database.dart';
import 'package:contratado/interfaces/database/mixins/i_searcher_database.dart';

abstract class ISQLDatabase
    with
        IAccessDatabase,
        IRegisterDatabase,
        ISessionDatabase,
        ISearcherDatabase {}
