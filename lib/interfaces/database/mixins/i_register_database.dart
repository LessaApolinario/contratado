mixin IRegisterDatabase<Entity> {
  Future<bool> registerContractor(Entity entity);

  Future<bool> registerServiceProvider(Entity entity);
}
