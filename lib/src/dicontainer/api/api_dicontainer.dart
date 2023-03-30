import 'package:contratado/src/core/interfaces/services/i_publication_service.dart';
import 'package:contratado/src/core/interfaces/services/i_user_service.dart';
import 'package:contratado/src/dicontainer/dicontainer.dart';

class APIDIContainer extends DIContainer {
  @override
  IPublicationService getPublicationService() {
    // TODO: implement getPublicationService
    throw UnimplementedError();
  }

  @override
  IUserService getUserService() {
    // TODO: implement getUserService
    throw UnimplementedError();
  }
}