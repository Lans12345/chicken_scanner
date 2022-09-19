import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../home/home_page.dart';

class Create_Page extends StatefulWidget {
  const Create_Page({Key? key}) : super(key: key);

  @override
  State<Create_Page> createState() => _Create_PageState();
}

class _Create_PageState extends State<Create_Page> {
  late String username;
  late String password;
  late String name;
  late String age;
  late String gender;
  late String birthDate;
  late String address;
  late String phoneNumber;

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-up Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (String input) {
                    username = input;
                  },
                  decoration: const InputDecoration(label: Text('Username')),
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (String input) {
                    password = input;
                  },
                  decoration: const InputDecoration(label: Text('Password')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  onChanged: (String input) {
                    name = input;
                  },
                  decoration:
                      const InputDecoration(label: Text('Complete Name')),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (String input) {
                    age = input;
                  },
                  decoration: const InputDecoration(label: Text('Age')),
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  onChanged: (String input) {
                    gender = input;
                  },
                  decoration: const InputDecoration(label: Text('Gender')),
                ),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  onChanged: (String input) {
                    birthDate = input;
                  },
                  decoration: const InputDecoration(label: Text('BirthDate ')),
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  onChanged: (String input) {
                    address = input;
                  },
                  decoration: const InputDecoration(label: Text('Address')),
                ),
                TextFormField(
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  onChanged: (String input) {
                    phoneNumber = input;
                  },
                  decoration:
                      const InputDecoration(label: Text('Phone Number')),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      MaterialButton(
                          height: 50,
                          minWidth: 80,
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          color: Colors.brown,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: MaterialButton(
                            height: 50,
                            minWidth: 80,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            color: Colors.brown,
                            onPressed: () {
                              box.write('my_username', username);
                              box.write('my_password', password);
                              box.write('myName', name);
                              box.write('myAge', age);
                              box.write('myGender', gender);
                              box.write('myBday', birthDate);
                              box.write('myAdd', address);
                              box.write('myNum', phoneNumber);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
