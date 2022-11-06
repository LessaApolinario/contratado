mixin IRegisterDatabase {
  Future<bool> registerContractor(Map<String, dynamic> entity);

  Future<bool> registerServiceProvider(Map<String, dynamic> entity);
}
