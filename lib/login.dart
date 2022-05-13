import 'package:baseproject/core/viewmodels/login_viewmodel.dart';
import 'package:baseproject/main.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/home.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/ui/ui_helper/color.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Login',
      home: LoginScreen(),
    ),
  );
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BaseView<LoginViewModel>(
      onModelReady: (model) async {},
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login.jpeg"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: new Image.asset('assets/logo.jpeg'),
                  width: 150,
                  height: 150,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Insert your username',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Insert your password',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Center(
                      child: Text('Login'),
                    ),
                    onPressed: () async {
                      BotToast.showLoading();
                      bool status = await model.login(
                          nameController.text, passwordController.text);
                      BotToast.closeAllLoading();

                      if (status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage(
                                title: "PenangOne",
                              );
                            },
                          ),
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
