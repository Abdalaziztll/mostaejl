import 'package:flutter/material.dart';
import 'package:herry_up/core/data/auth/auth.dart';
import 'package:herry_up/task2/view/homepage.dart';

// TODO : create pofile page from getIt storage

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController birthDate = TextEditingController();
TextEditingController gender = TextEditingController();
GlobalKey<FormState> formState = new GlobalKey<FormState>();
// bool isSecurePassword = true;

class ProfilePage extends StatefulWidget { 
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 142, 132, 132),
        actions: [
          IconButton(
            onPressed: () {
              bool status = AuthServiceMock.signUp(name.text, password.text,
                  phone.text, gender.text, birthDate.text);
              if (formState.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              } else {
                print(status.toString());
              }
            },
            icon: Icon(Icons.check),
            padding: EdgeInsets.all(20),
          )
        ],
      ),
      body: Form(
        key: formState,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 160,
                width: 160,
                child: ClipOval(child: (Image.asset("images/pic2.jpg"))),
              ),
              Spacer(),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.person),
                    label: Text("Name"),
                    hintText: 'enter your name',
                  ),
                ),
              ),

              Spacer(),

              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'enter your phon number',
                      label: Text("Phon number")),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText:  true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.lock),
                      suffix: Icon(Icons.remove_red_eye),
                      hintText: 'password',
                      label: Text("password")),
                ),
              ),

              Spacer(),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Birthday"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.cake),
                    hintText: 'enter your birthday',
                  ),
                ),
              ),

              Spacer(),
              SizedBox(
                width: 300,
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    label: Text("gender"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.people_alt),
                    hintText: ' Gender',

                  ),
                ),
              ),
              Spacer(),
              Center(
                  child: IconButton(
                      onPressed: () {
                        bool status = AuthServiceMock.signUp(
                            name.text,
                            password.text,
                            phone.text,
                            gender.text,
                            birthDate.text);
                            print(status);
                        if (status) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          },),);
                        } else {
                          // Do Something to Show the user
                          print(status.toString());
                        }
                      },
                      icon: Icon(Icons.person_search)))
            ],
          ),
        ),
      ),
    );
// AuthServiceMock().signUp(name, password, phone, gender, birthDate)
  }
}

