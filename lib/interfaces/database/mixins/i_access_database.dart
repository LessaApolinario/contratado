mixin IAccessDatabase {
  Future<Object> connect();

  Future<void> close();
}
