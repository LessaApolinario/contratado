mixin IPublicationCreatorDatabase {
  Future<void> createContractorPublication(Map<String, dynamic> data);

  Future<void> createServiceProviderPublication(Map<String, dynamic> data);
}
