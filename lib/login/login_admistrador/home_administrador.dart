import 'package:flutter/material.dart';
import 'package:nucleo/components/blog.dart';
import 'package:nucleo/routes.dart';

class HomeAdministrador extends StatefulWidget {
  const HomeAdministrador({Key? key}) : super(key: key);

  @override
  State<HomeAdministrador> createState() => _HomeAdministradorState();
}

class _HomeAdministradorState extends State<HomeAdministrador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: WillPopScope(
      //   onWillPop: () async {
      //     Navigator.pushNamedAndRemoveUntil(context, Routes.home, (Route<dynamic> route) => false);
      //     return true;
      //   },
      //   child: Drawer(
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         const UserAccountsDrawerHeader(
      //           accountName: Text('user',
      //               style: TextStyle(
      //                 color: Colors.black54,
      //                 fontWeight: FontWeight.w500,
      //               )),
      //           accountEmail: Text('email',
      //               style: TextStyle(
      //                 color: Colors.black54,
      //                 fontWeight: FontWeight.w500,
      //               )),
      //         ),
      //         ListTile(
      //           dense: true,
      //           title: const Text('Sair'),
      //           trailing: const Icon(Icons.exit_to_app),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           dense: true,
      //           title: const Text('Search'),
      //           trailing: const Icon(Icons.search),
      //           onTap: () {},
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // appBar: AppBar(
      //   flexibleSpace: const Text('user',
      //       textAlign: TextAlign.right,
      //       style: TextStyle(
      //         color: Colors.black54,
      //         fontWeight: FontWeight.w500,
      //       )),
      //   title: const Text('name',
      //       style: TextStyle(
      //         color: Colors.black54,
      //         fontWeight: FontWeight.w500,
      //       )),
      //   centerTitle: true,
      // ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MenuBar1(),
        ),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 150,
                child:
                    Image.asset("assets/images/Logo.png", fit: BoxFit.contain),
              ),
            ),
            // const Text(
            //   "Welcome Back",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text('email',
            //     style: TextStyle(
            //       color: Colors.black54,
            //       fontWeight: FontWeight.w500,
            //     )),
            // const Text('name',
            //     style: TextStyle(
            //       color: Colors.black54,
            //       fontWeight: FontWeight.w500,
            //     )),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.registerempresas),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black, // Set border color
                              width: 0.2), // Set border width
                          borderRadius: const BorderRadius.all(Radius.circular(
                              5.0)), // Set rounded corner radius
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 0.1,
                                color: Colors.black,
                                offset: Offset(0.1, 1))
                          ], // Make rounded corner of border
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.domain_add,
                                size: 50,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Adicionar Empresa",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.cadastroespecificador),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black, // Set border color
                              width: 0.2), // Set border width
                          borderRadius: const BorderRadius.all(Radius.circular(
                              5.0)), // Set rounded corner radius
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 0.1,
                                color: Colors.black,
                                offset: Offset(0.1, 1))
                          ], // Make rounded corner of border
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.person_add,
                                size: 50,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Adicionar Especificador",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black, // Set border color
                            width: 0.2), // Set border width
                        borderRadius: const BorderRadius.all(
                            Radius.circular(5.0)), // Set rounded corner radius
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0.1,
                              color: Colors.black,
                              offset: Offset(0.1, 1))
                        ], // Make rounded corner of border
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.post_add,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Adicionar Premio",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ActionChip(label: const Text("Logout"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
