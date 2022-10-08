import 'package:flutter/material.dart';

class ContractorsPage extends StatefulWidget {
  const ContractorsPage({super.key});

  @override
  State<ContractorsPage> createState() => _ContractorsPageState();
}

// final String colorButtonsCard = "#246B32";
// final String colorPrimary = "rgba(36, 107, 50, 0.8)";
// final String colorItem = "rgba(36, 107, 50, 0.6)";
// final String colorNavBarItem = "rgba(36, 107, 50, 0.24)";

class _ContractorsPageState extends State<ContractorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xCC246B32),
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(
                width: 220.0,
                height: 46.0,
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                    suffixIcon: Icon(
                      Icons.highlight_remove_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    hintText: "Pesquisar",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    focusColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 36,
              ),
            ],
          ),
        ),
      ),
      body: const Text(""),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE7E0EC),
        selectedIconTheme: const IconThemeData(
          color: Color(0xFF1D192B),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF1D192B),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF49454F),
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF49454F),
        ),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
              size: 24,
            ),
            icon: Icon(
              IconData(
                0xf87b,
                fontFamily: "Roboto",
                fontPackage: "Cupertino",
              ),
            ),
            label: "Prestadores",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
              size: 24,
            ),
            icon: Icon(
              IconData(
                0xf87b,
                fontFamily: "Roboto",
                fontPackage: "Cupertino",
              ),
            ),
            label: "Solicitações",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
              size: 24,
            ),
            icon: Icon(
              IconData(
                0xf87b,
                fontFamily: "Roboto",
                fontPackage: "Cupertino",
              ),
            ),
            label: "Perfil",
          )
        ],
      ),
    );
  }
}
