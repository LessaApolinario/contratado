import 'package:contratado/src/core/interfaces/services/i_publication_service.dart';
import 'package:contratado/src/core/interfaces/services/i_user_service.dart';

abstract class DIContainer {
  IUserService getUserService();

  IPublicationService getPublicationService();
}
