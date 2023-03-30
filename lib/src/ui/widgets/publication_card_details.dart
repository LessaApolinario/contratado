import 'package:flutter/material.dart';

class PublicationCardDetails extends StatefulWidget {
  const PublicationCardDetails(
      {super.key,
      required this.username,
      required this.description,
      required this.phone,
      required this.email,
      required this.userDescription});

  final String username;
  final String description;
  final String phone;
  final String email;
  final String userDescription;

  @override
  State<PublicationCardDetails> createState() => _PublicationCardDetailsState();
}

class _PublicationCardDetailsState extends State<PublicationCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 20,
        bottom: 50,
        left: 20,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFE7E0EC),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF246B32),
                      shape: const CircleBorder(),
                      fixedSize: const Size(40, 40),
                    ),
                    onPressed: () {},
                    child: Text(
                      widget.username[0].toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFFFFFBFE),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          color: Color(0xFF1C1B1F),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          color: Color(0xFF1C1B1F),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  fixedSize: const Size(25, 19),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: const Text(
                  "X",
                  style: TextStyle(
                    color: Color(0xFF1C1B1F),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              widget.phone,
              style: const TextStyle(
                color: Color(0xFF246B32),
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              widget.email,
              style: const TextStyle(
                color: Color(0xFF246B32),
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              widget.userDescription,
              style: const TextStyle(
                color: Color(0xFF246B32),
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
