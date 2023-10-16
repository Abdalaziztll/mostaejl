import 'package:flutter/material.dart';
import 'package:herry_up/core/data/auth/auth.dart';
import 'package:herry_up/task2/view/homepage.dart';

final _Signkey = GlobalKey<FormState>();
final _namecontroller = TextEditingController();
final _phone = TextEditingController();
final _passwordcontroller = TextEditingController();
final _gendercontroller = TextEditingController();
final _BirthDate = TextEditingController();
bool passwordScure = true;
String name = "";
String password = "";
String phone = "";
String gender = "";
String birthDate = "";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// TODO : Build SignUP Page and Send your Data to Function Called AuthServiceMock().SignUp()

// ? SignUP method has name , phone , password , gender and BirthDate 

// ?  also the navigate will be to Home Page if the method return true 

class _SignUpPageState extends State<SignUpPage> {
    DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Sing Up',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Form(
          key: _Signkey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    hintText: 'please enter your name',
                    prefixIcon: Icon(Icons.person_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    // enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(
                    //         color: Color.fromARGB(255, 3, 65, 113))),
                    // focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(
                    //         color: Color.fromARGB(255, 44, 122, 186))),
                    // errorBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    // focusedErrorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //     borderSide: BorderSide(
                    //         color: Color.fromARGB(255, 44, 122, 186))),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your name ';
                    }
                    if (value.length < 5) {
                      return 'please enter more than 5 characters';
                    }
                    final RegExp regex = RegExp(r'^[a-zA-Z- ]+$');
                    if (!regex.hasMatch(value)) {
                      return ' Please Enter a string';
                    }
                    else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(
                    hintText: 'please enter your phone number',
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone number';
                    }
                    if (value.length < 10) {
                      return ' Please enter 10 number';
                    }
                    final RegExp regex = RegExp(r'^[0-9]+$');
                    if (!regex.hasMatch(value)) {
                      return ' Please Enter true number';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value2) {
                    setState(() {
                      phone = value2;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                      hintText: 'please enter your password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordScure = !passwordScure;
                            });
                          },
                          icon: password == true
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility))),
                  obscureText: passwordScure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    if (value.length < 9) {
                      return 'please enter more than 8 charactars';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value3) {
                    setState(() {
                      password = value3;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _gendercontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people_alt_rounded),
                      hintText: 'please enter male or female',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter male or female ';
                    }
                    if (value != 'male' && value != 'female') {
                      return 'please enter male or female';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value4) {
                    setState(() {
                      gender = value4;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onTap: ()async {
                   DateTime? newDate= await showDatePicker(context: context,
                     initialDate: date,
                      firstDate:DateTime (1990),
                       lastDate:DateTime(2050)
                       );
                if(newDate== null)
                  return ;
             
                setState(() {
                   date= newDate;
                     _BirthDate.text = date.toString();

                });
                  },
                  controller: _BirthDate,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    hintText: 'please enter your BirthDate (01/01/2000)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your BirthDate';
                    }
                    // final RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                    // if (!regex.hasMatch(value)) {
                    //   return 'Invalid date format. Please enter a valid date';
                    // }
                    return null;
                  },
                  onChanged: (value5) {
                    setState(() {
                      birthDate = value5;
                    });
                  },
                )
              ],
            ),
          ),
          onChanged: () {},
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              if (_Signkey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));

                    AuthServiceMock check = AuthServiceMock();

                 bool ischeck =  check.signUp( name,password,phone,gender,birthDate); 
                  print("check:$ischeck");
              }
            },
            child: Container(
                width: double.infinity,
                height: 70,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
          ),
        ))
      ]),
    );
  }
}