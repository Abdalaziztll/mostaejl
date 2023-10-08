import 'package:flutter/material.dart';
import 'package:herry_up/task2/view/homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// TODO : Build SignUP Page and Send your Data to Function Called AuthServiceMock().SignUp()

// ? SignUP method has name , phone , password , gender and BirthDate 

// ?  also the navigate will be to Home Page if the method return true 

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  String text ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: Text("SIGN UP"),
      ),
      ),
       body: Form(
        key: formState,
        child: Column(children: [Container(height: 100,),
          SizedBox(width: 500,
            child: TextFormField(controller: textController,
            validator: (String? value) {
                  if (value == "") {
                    return "false";
                  } else {
                    return null;
                  }
                },
              decoration:InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            ),
          ),
          SizedBox(width: 500,
            child: TextFormField(controller: passwordController,
            validator: (String? value) {
                    if (passwordController.text.length < 8) {
                      return 'false';
                    } else {
                      return null;
                    }
                  },
              decoration:InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            ),
          ),
           SizedBox(width: 500,
            child: TextFormField(controller: phoneController,
validator: (value) {
                    if (value!.isEmpty||!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[(]{0,1}[-\s\./0-9]+$').hasMatch(value!) ) {
                      return "false";
                    } else {
                      return null;
                    }
                  },
              decoration:InputDecoration(
              hintText: "Phone",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            ),
          ),
           SizedBox(width: 500,
            child: TextFormField(controller: genderController,
            validator: (value) {
                    if (value! == "male"|| value=="Female" ) {
                      return null;
                    } else {
                      return "false";
                    }
                  },
              decoration:InputDecoration(
              hintText: "Gender",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            ),
          ),
           SizedBox(width: 500,
            child: TextFormField(controller: birthdateController,
validator: (String? value) {
                  if (value == "") {
                    return "false";
                  } else {
                    return null;
                  }
                },
              decoration:InputDecoration(
              hintText: "Birth Date",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            ),
          ),
          Expanded(
              child: SizedBox(
                height: 10,
                width: 1000,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        var formdata = formState.currentState;
                        if (formdata!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              },
                            ),
                          );
                        } else {
                          print('Not valid');
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}