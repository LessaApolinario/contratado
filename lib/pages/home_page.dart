import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// final String colorButtonsCard = "#246B32";
// final String colorPrimary = "rgba(36, 107, 50, 0.8)";
// final String colorItem = "rgba(36, 107, 50, 0.6)";
// final String colorNavBarItem = "rgba(36, 107, 50, 0.24)";

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static final List<Widget> _pages = [
    const Text("Lista de prestadores"),
    const Text("Lista de solicitações"),
    const Text("Perfil"),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE7E0EC),
        selectedItemColor: const Color(0xFF1D192B),
        unselectedItemColor: const Color(0xFF49454F),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
        ),
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
            ),
            icon: Icon(
              Icons.square_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
            ),
            icon: Icon(
              Icons.square_outlined,
            ),
            label: "Solicitações",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.circle,
            ),
            icon: Icon(
              Icons.square_outlined,
            ),
            label: "Perfil",
          )
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
