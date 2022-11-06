import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contratado/controllers/publication_controller.dart';
import 'package:contratado/models/publication.dart';
import 'package:contratado/widgets/publication_card.dart';
import 'package:flutter/material.dart';

class ServiceProvidersPublicationsPage extends StatefulWidget {
  const ServiceProvidersPublicationsPage({super.key});

  @override
  State<ServiceProvidersPublicationsPage> createState() =>
      _ServiceProvidersPublicationsPageState();
}

class _ServiceProvidersPublicationsPageState
    extends State<ServiceProvidersPublicationsPage> {
  final CollectionReference _publications =
      FirebaseFirestore.instance.collection("publications");
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userDescriptionController =
      TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nome de usuário',
                ),
              ),
              TextField(
                controller: _userTypeController,
                decoration: const InputDecoration(
                  labelText: 'Tipo: (contratante ou prestador de serviço)',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              TextField(
                controller: _userDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição extra',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Criar publicação'),
                onPressed: () async {
                  Publication publication = Publication(
                    username: _usernameController.text,
                    userType: _userTypeController.text,
                    description: _descriptionController.text,
                    phone: _phoneController.text,
                    email: _emailController.text,
                    userDescription: _userDescriptionController.text,
                  );

                  PublicationController publicationController =
                      PublicationController(_publications);
                  await publicationController
                      .createServiceProviderPublication(publication);

                  _usernameController.text = '';
                  _userTypeController.text = '';
                  _descriptionController.text = '';
                  _phoneController.text = '';
                  _emailController.text = '';
                  _userDescriptionController.text = '';
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: _publications.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                return PublicationCard(
                  name: documentSnapshot["username"],
                  description: documentSnapshot["description"],
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xCC246B32),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color(0xCC246B32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
