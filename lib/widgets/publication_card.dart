import 'package:flutter/material.dart';

class PublicationCard extends StatefulWidget {
  const PublicationCard(
      {super.key, required this.name, required this.description});

  final String name;
  final String description;

  @override
  State<PublicationCard> createState() => _PublicationCardState();
}

// final String colorButtonsCard = "#246B32";
// final String colorPrimary = "rgba(36, 107, 50, 0.8)";
// final String colorItem = "rgba(36, 107, 50, 0.6)";
// final String colorNavBarItem = "rgba(36, 107, 50, 0.24)";

class _PublicationCardState extends State<PublicationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0x99246B32),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 47,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: const Size(25, 19),
              shape: const CircleBorder(),
            ),
            onPressed: () {},
            child: const Text(
              "!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
