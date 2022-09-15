import 'package:flutter/material.dart';

class HomeAdministrador extends StatefulWidget {
  const HomeAdministrador({Key? key}) : super(key: key);

  @override
  State<HomeAdministrador> createState() => _HomeAdministradorState();
}

class _HomeAdministradorState extends State<HomeAdministrador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('user',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              accountEmail: Text('email',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            ListTile(
              dense: true,
              title: const Text('Sair'),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              title: const Text('Search'),
              trailing: const Icon(Icons.search),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        flexibleSpace: const Text('user',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            )),
        title: const Text('name',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child:
                    Image.asset("assets/images/Logo.png", fit: BoxFit.contain),
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('email',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              const Text('name',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 15,
              ),
              ActionChip(label: const Text("Logout"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
