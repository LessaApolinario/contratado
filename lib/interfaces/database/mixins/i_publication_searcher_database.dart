mixin IPublicationSearcherDatabase {
  Future<List<Map<String, Object?>>> findContractorsPublications();

  Future<List<Map<String, Object?>>> findServiceProvidersPublications();
}
