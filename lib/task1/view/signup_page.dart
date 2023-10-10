import 'package:flutter/material.dart';
import 'package:herry_up/task2/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool success = false;
  String text ="";
  dynamic storage = "";
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 30, 116, 186),
        title: Center(child: Text("Sign Up",
        style: TextStyle(color: Colors.white),),
      ),
      ),
       body: Form(
        key: formState,
        child: Column(
          children: [Container(height: 250,
        width: 400,
        child: Image.asset("assets/car.png"),),
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
              enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 116, 186),),
                  ),
                  prefixIcon: Icon(Icons.person,
color: Colors.grey,
size: 20,
),
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
                  obscureText: isPressed,
              decoration:InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 116, 186),),
                  ),
                  prefixIcon: Icon(Icons.key,
color: Colors.grey,
size: 20,
),
suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    icon: isPressed == true
                        ? const Icon(Icons.visibility,color: Color.fromARGB(255, 30, 116, 186),)
                        : const Icon(Icons.visibility_off,color: Colors.grey),
                  ),

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
              enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 116, 186),),
                  ),
                  prefixIcon: Icon(Icons.phone,
color: Colors.grey,
size: 20,
),
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
              enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 116, 186),),
                  ),
                  prefixIcon: Icon(Icons.male,
color: Colors.grey,
size: 20,
),
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
              enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 116, 186),),
                  ),
                  prefixIcon: Icon(Icons.calendar_month,
color: Colors.grey,
size: 20,
),
            ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 15)),
          Container(height: 50,
          width: 400,
          decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20),
          color: Color.fromARGB(255, 30, 116, 186),),
            child: Center(
              child: TextButton(
                onPressed: () {
                  signUp(String name,String password,String phone,String gender,String birthDate){
  if (password.length > 8 && phone.length > 10 && name.length >4){
    success = true;
    
  }else {
    success = false ;
    
  }
  storage.get<SharedPreferences>().setBool('auth_state',success);

  return success;

  
}
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
        ],
        ),
      ),
    );
  }
}