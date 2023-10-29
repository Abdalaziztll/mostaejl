import 'package:flutter/material.dart';
import 'package:herry_up/core/data/model/user.dart';
import 'package:herry_up/core/data/service/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// ?TODO : create service function and send the user model to back end

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _birthcontroller = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();
  bool _male = true;
  late bool _fmale = !_male;
  late String gender;
  @override
  void initState() {
    // ?TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // ?TODO: implement dispose
    super.dispose();
    _emailecontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    _phonecontroller.dispose();
    _birthcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sIzE = MediaQuery.of(context).size;
    return Form(
      key: formstate,
      child: Scaffold(
        body: Center(
          child: Container(
            width: sIzE.width * 1 / 3,
            height: sIzE.height,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Column(
              children: [
                SizedBox(
                  height: sIzE.height * 1 / 25,
                ),
                Container(
                  width: sIzE.width * 1 / 3,
                  height: sIzE.height * 1 / 6,
                  decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("asset/Group.png")),
                  ),
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: TextFormField(
                          controller: _namecontroller,
                          decoration: const InputDecoration(
                            label: Text(
                              'Enter your Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'username',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: TextFormField(
                          controller: _emailecontroller,
                          decoration: const InputDecoration(
                            label: Text(
                              'Enter email or username',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordcontroller,
                          decoration: const InputDecoration(
                            label: Text(
                              'Enter your password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Male',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                                Checkbox(
                                    value: _male,
                                    onChanged: (val) {
                                      setState(() {
                                        _male = val!;
                                        _fmale = !val;
                                        if (_male == true) {
                                          gender = 'male';
                                        }
                                      });
                                    }),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                const Text(
                                  'FMale',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                                Checkbox(
                                    value: _fmale,
                                    onChanged: (val) {
                                      setState(() {
                                        _fmale = val!;
                                        _male = !val;
                                        if (_fmale == true) {
                                          gender = 'fmale';
                                        }
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'BIRTHDATE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            Container(
                              width: sIzE.width * 1 / 6,
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: TextFormField(
                                controller: _birthcontroller,
                                decoration: const InputDecoration(
                                  label: Text(
                                    'Enter your birthdate',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Phone',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: TextFormField(
                            controller: _phonecontroller,
                            decoration: const InputDecoration(
                              label: Text(
                                'Enter your Phone',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // bool status =
                            await AuthServiceImpl().signUP(UserModel(
                                name: _namecontroller.text,
                                password: _passwordcontroller.text,
                                birth: _birthcontroller.text,
                                email: _emailecontroller.text,
                                phone: _phonecontroller.text,
                                gender: gender));

                            // ignore: use_build_context_synchronously

                            // if (status == true) {
                            // } else{

                            // }

                            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          },
                          child: Center(
                            child: Container(
                              width: sIzE.width * 1 / 3,
                              height: sIzE.height * 1 / 18,
                              decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
