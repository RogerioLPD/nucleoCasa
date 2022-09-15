import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class EmpresasHomePage extends StatefulWidget {
  const EmpresasHomePage({Key? key}) : super(key: key);
  get textPrimary => const Color(0xFF111111);

  @override
  State<EmpresasHomePage> createState() => _EmpresasHomeState();
}

class _EmpresasHomeState extends State<EmpresasHomePage> {
  final _auth = FirebaseAuth.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  String nome = '';
  String email = '';

  get textPrimary => const Color(0xFF111111);

  @override
  // ignore: must_call_super
  initState() {
    pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    pegarUsuario();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nome),
              accountEmail: Text(email),
            ),
            ListTile(
              dense: true,
              title: const Text('Sair'),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () {
                sair();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            nome,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  pegarUsuario() async {
    // ignore: await_only_futures
    /* User? usuario = await _firebaseAuth.currentUser;*/
    User? usuario = _auth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }

  sair() async {
    await _firebaseAuth
        .signOut()
        .then((user) => Navigator.pushNamed(context, Routes.home));
  }
}
