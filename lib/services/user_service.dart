import 'package:contratado/interfaces/repositories/i_user_repository.dart';
import 'package:contratado/interfaces/services/i_user_service.dart';
import 'package:contratado/models/user.dart';

class UserService implements IUserService {
  late IUserRepository _userRepository;

  UserService(IUserRepository userRepository) {
    _userRepository = userRepository;
  }

  @override
  Future<bool> login(String email, String password) async {
    return await _userRepository.login(email, password);
  }

  @override
  Future<bool> registerContractor(User user) async {
    final bool userExists = await _userRepository.find(user.email.toString());

    if (userExists) {
      throw Exception(["Contratante já existente!"]);
    }

    return await _userRepository.registerContractor(user);
  }

  @override
  Future<bool> registerServiceProvider(User user) async {
    final bool userExists = await _userRepository.find(user.email.toString());

    if (userExists) {
      throw Exception(["Prestador de serviço já existente!"]);
    }

    return await _userRepository.registerServiceProvider(user);
  }
}
