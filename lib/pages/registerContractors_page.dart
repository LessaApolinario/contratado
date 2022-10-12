import 'package:contratado/database/dao/implementations/user_dao.dart';
import 'package:contratado/database/implementations/sqlite_database.dart';
import 'package:contratado/models/user.dart';
import 'package:flutter/material.dart';

class RegisterContractorPage extends StatefulWidget {
  const RegisterContractorPage({super.key});

  @override
  State<RegisterContractorPage> createState() => _RegisterContractorPageState();
}

class _RegisterContractorPageState extends State<RegisterContractorPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Text(
                    "Registro de Contratante",
                    style: TextStyle(
                      color: Color(0xFF246B32),
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF246B32),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    labelText: "Nome",
                    hintText: "Nome",
                    focusColor: Color(0xFF246B32),
                    fillColor: Color(0xFF246B32),
                    labelStyle: TextStyle(
                      color: Color(0xFF246B32),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF246B32),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    labelText: "E-mail",
                    hintText: "E-mail",
                    focusColor: Color(0xFF246B32),
                    fillColor: Color(0xFF246B32),
                    labelStyle: TextStyle(
                      color: Color(0xFF246B32),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: cpfController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF246B32),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    labelText: "CPF",
                    hintText: "CPF",
                    focusColor: Color(0xFF246B32),
                    fillColor: Color(0xFF246B32),
                    labelStyle: TextStyle(
                      color: Color(0xFF246B32),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF246B32),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    labelText: "Senha",
                    hintText: "Senha",
                    focusColor: const Color(0xFF246B32),
                    fillColor: const Color(0xFF246B32),
                    labelStyle: const TextStyle(
                      color: Color(0xFF246B32),
                    ),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: _isHidden
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  obscureText: _isHidden,
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF246B32),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    fixedSize: const Size(220, 40),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: register,
                  child: const Text(
                    "Registrar-se",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    User user = User(
      type: "contractor",
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      password: passwordController.text,
    );
    SQLiteDatabase sqLiteDatabase = SQLiteDatabase();
    UserDAO userDAO = UserDAO(sqLiteDatabase);
    bool registedContractor = await userDAO.registerContractor(user);
    bool isFormKeyValid = _formKey.currentState!.validate();

    if (isFormKeyValid && registedContractor) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/');
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
