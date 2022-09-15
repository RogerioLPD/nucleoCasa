import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Flutter Dialog"),
      ),*/
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              /*Get.defaultDialog(
                  title: 'My Pop Up Dialog',
                  middleText: 'Hello my Friends',
                  backgroundColor: Colors.green,
                  titleStyle: const TextStyle(color: Colors.redAccent),
                  middleTextStyle: const TextStyle(color: Colors.white));*/

              Get.defaultDialog(
                  title: '',
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text(
                        'NÚCLEO CASA DECOR',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 46, 82),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "E-MAIL", hintMaxLines: 1)
                          /*border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(0, 76, 175, 79),
                                    width: 4.0))),*/
                          ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "SENHA", hintMaxLines: 1)
                          /*border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(0, 76, 175, 79),
                                    width: 4.0))),*/
                          ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text(
                            'ENTRAR',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ))
                    ],
                  ));
            },
            child: const Text('Show Dialog')),
      ),
    );
  }
}
