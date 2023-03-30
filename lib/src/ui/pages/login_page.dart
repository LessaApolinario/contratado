import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
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
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF246B32),
                      fontSize: 64,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/register/contractor',
                    );
                  },
                  child: const Text(
                    "Cadastrar como contratante",
                    style: TextStyle(
                      color: Color(0xFF246B32),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "ou",
                  style: TextStyle(
                    color: Color(0xFF246B32),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/resgiter/service_provider',
                    );
                  },
                  child: const Text(
                    "Cadastrar como prestador de serviço",
                    style: TextStyle(
                      color: Color(0xFF246B32),
                      decoration: TextDecoration.underline,
                    ),
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
                  onPressed: login,
                  child: const Text(
                    "Entrar",
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void login() async {
    bool isFormKeyValid = _formKey.currentState!.validate();
    bool userExists = true;

    if (isFormKeyValid && userExists) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home');
    }
  }
}
