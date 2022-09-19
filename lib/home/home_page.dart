import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../create_account/create.dart';
import '../forgot_pass/forgot_pass.dart';
import '../main_menu/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log-in Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              const CircleAvatar(
                minRadius: 150,
                maxRadius: 150,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/1864/1864470.png'),
                backgroundColor: Colors.white10,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  onChanged: (String input) {
                    username = input;
                  },
                  decoration: const InputDecoration(label: Text('Username')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  obscureText: true,
                  onChanged: (String input) {
                    password = input;
                  },
                  decoration: const InputDecoration(label: Text('Password')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 175),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Forgot_Pass()));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                minWidth: 250,
                height: 50,
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                color: Colors.brown,
                onPressed: () {
                  if (username == box.read('my_username') &&
                      password == box.read('my_password')) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const main_menu()));
                  } else {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Invalid Account'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close')),
                            ],
                          );
                        });
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: .8,
                    ),
                  )),
              MaterialButton(
                  height: 50,
                  minWidth: 240,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.brown,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Create_Page()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
