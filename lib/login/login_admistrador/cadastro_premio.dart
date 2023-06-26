import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nucleo/components/color.dart';

import '../../routes.dart';

class CadastroPremio extends StatefulWidget {
  const CadastroPremio({Key? key}) : super(key: key);

  @override
  State<CadastroPremio> createState() => _CadastroPremioState();
}

class _CadastroPremioState extends State<CadastroPremio> {
  bool isActive = false;
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaCController = TextEditingController();
  bool visivelSenha = true;
  bool visivelCSenha = true;

  void verSenha() {
    setState(() {
      visivelSenha = !visivelSenha;
    });
  }

  void verCSenha() {
    setState(() {
      visivelCSenha = !visivelCSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .0,
                ),
                Image.asset(
                  'assets/images/Logo.png',
                  width: 460,
                  height: 240,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _nomeController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Nome ou Razão Social',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.person_outlined,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfOuCnpjFormatter()
                    ],
                    autofocus: false,
                    controller: _cpfController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Cpf Cnpj não pode estar vazio");
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: "CPF/CNPJ",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xFF3A3A3A),
                        ))),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu e-mail',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu e-mail';
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Digite um e-mail válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: visivelSenha,
                  controller: _senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(visivelSenha
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        verSenha();
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: visivelCSenha,
                  controller: _senhaCController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Confirme sua senha',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(visivelCSenha
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        verCSenha();
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirme sua senha';
                    } else if (value != _senhaController.text) {
                      return 'Suas senhas não conferem';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isActive,
                      onChanged: (value) => setState(() {
                        isActive = value!;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        'Eu aceito os termos e condições\ne a politica de privacidade',
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    elevation: 0,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool cadastro = await fazerCadastro();
                        if (cadastro) {
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Erro ao fazer cadastro')),
                          );
                        }
                      }
                    },
                    child: Text(
                      'REGISTRAR',
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Já tem uma conta? Faça o Login ",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.pushNamed(context, Routes.loginview),
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    elevation: 0,
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.loginview),
                    child: Text(
                      'VOLTAR',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF3A3A3A),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> fazerCadastro() async {
    var url =
        Uri.parse('https://rogerio-esms.herokuapp.com/api/cadastro/empresa/');
    Map<String, String> headers = {
      'content-type': 'application/json',
    };
    Map<String, dynamic> body = {
      'email': _emailController.text,
      'password': _senhaController.text,
    };
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
