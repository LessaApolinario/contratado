import 'package:contratado/controllers/user_controller.dart';
import 'package:contratado/models/user.dart';
import 'package:flutter/material.dart';

class RegisterServiceProviderPage extends StatefulWidget {
  const RegisterServiceProviderPage({super.key});

  @override
  State<RegisterServiceProviderPage> createState() =>
      _RegisterServiceProviderPageState();
}

class _RegisterServiceProviderPageState
    extends State<RegisterServiceProviderPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _isHidden = true;

  String dropdownvalue = 'Pedreiro';

  var items = [
    'Pedreiro',
    'Empregada doméstica',
    'Carpinteiro',
    'Encanador',
    'Organizer',
  ];

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
                    "Registro de Prestador de Serviço",
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
                  height: 30,
                ),
                TextFormField(
                  controller: phoneController,
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
                    labelText: "Telefone",
                    hintText: "Ex.(82)99999-9999",
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
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFF246B32),
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: DropdownButton(
                    alignment: AlignmentDirectional.center,
                    underline: Container(
                      height: 0,
                      color: Colors.white, //<-- SEE HERE
                    ),
                    value: dropdownvalue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF246B32),
                    ),
                    iconSize: 18,
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          onTap: () {},
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue = newValue!;
                        },
                      );
                    },
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    style: const TextStyle(
                      color: Color(0xFF246B32),
                      fontSize: 17,
                    ),
                    itemHeight: 48,
                  ),
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
      type: "service provider",
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      password: passwordController.text,
      phone: phoneController.text,
      specialty: dropdownvalue,
    );

    UserController userController = UserController();
    bool registedServiceProvider =
        await userController.registerServiceProvider(user);
    bool isFormKeyValid = _formKey.currentState!.validate();

    if (isFormKeyValid && registedServiceProvider) {
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
