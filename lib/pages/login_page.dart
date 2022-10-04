import 'dart:io';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 100),
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
                height: 60,
              ),
              TextFormField(
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
                  labelText: "Senha",
                  focusColor: Color(0xFF246B32),
                  fillColor: Color(0xFF246B32),
                  labelStyle: TextStyle(
                    color: Color(0xFF246B32),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
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
                onTap: () {},
                child: const Text(
                  "Cadastrar como prestador de serviço",
                  style: TextStyle(
                    color: Color(0xFF246B32),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
                onPressed: () {},
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
    );
  }
}
