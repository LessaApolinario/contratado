import 'package:contratado/database/dao/implementations/publication_dao.dart';
import 'package:contratado/database/implementations/sqlite_database.dart';
import 'package:contratado/models/publication.dart';
import 'package:contratado/widgets/publication_card.dart';
import 'package:flutter/material.dart';

class ServiceProvidersPublicationsPage extends StatefulWidget {
  const ServiceProvidersPublicationsPage({super.key});

  @override
  State<ServiceProvidersPublicationsPage> createState() =>
      _ServiceProvidersPublicationsPageState();
}

class _ServiceProvidersPublicationsPageState extends State<ServiceProvidersPublicationsPage> {
  late Future<List<Publication>> publications;
  @override
  void initState() {
    super.initState();
    SQLiteDatabase sqLiteDatabase = SQLiteDatabase();
    PublicationDAO publicationDAO = PublicationDAO(sqLiteDatabase);
    publications = publicationDAO.findServiceProvidersPublications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFutureBuild(),
    );
  }

  buildPublication(Publication publication) {
    return PublicationCard(
      name: publication.username ?? "",
      description: publication.description ?? "",
    );
  }

  buildListViewBuilder(List<Publication> publications) {
    return ListView.builder(
      itemCount: publications.length,
      itemBuilder: (BuildContext context, int index) {
        return buildPublication(publications[index]);
      },
    );
  }

  buildFutureBuild() {
    return FutureBuilder<List<Publication>>(
      future: publications,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListViewBuilder(snapshot.data!);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
