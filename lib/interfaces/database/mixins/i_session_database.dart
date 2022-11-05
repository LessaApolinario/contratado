mixin ISessionDatabase {
  Future<bool> login(String email, String password);
}
