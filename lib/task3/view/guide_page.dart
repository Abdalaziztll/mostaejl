// ignore_for_file: unnecessary_string_interpolations

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:herry_up/core/data/from_to_location.dart';

// TODO: create page has 2 textField and create empty list in the class

// ? send "from" and "to"  to function   ShortestPath().suggestionResult and save it your list

// ? setState with a Button to build listview.builder from this array

// ?  Add button in each listTile to to added to history

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
// create  class Pathe it has two parameter from and to

  List<Pathe> listPathe = [
    Pathe(
      'مزة',
      'برامكة',
    ),
    Pathe(
      'الاموين',
      'مالكي',
    ),
    Pathe(
      'مالكي',
      'برامكة',
    ),
    Pathe(
      'الاموين',
      'مالكي',
    ),
  ];

  final _controllerTo = TextEditingController();
  final _controllerFrom = TextEditingController();

  ///
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerTo.dispose();
    _controllerFrom.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  controller: _controllerFrom,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('From Location')),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  controller: _controllerTo,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text('To Location')),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  setState(() {
                    listPathe
                        .add(Pathe(_controllerFrom.text, _controllerTo.text));
                    ShortestPath().fromLocation(_controllerFrom.text, []);
                    ShortestPath().toLocation(_controllerTo.text, []);
                  });
                },
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(12),
                width: 400,
                height: 450,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(31, 110, 104, 104),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: ListView.builder(
                  itemCount: listPathe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 400,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            alignment: Alignment.center,
                            child: Text(
                              '${listPathe[index].fromlocation}',
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            alignment: Alignment.center,
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.blueGrey,
                                size: 16,
                                weight: double.maxFinite),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            alignment: Alignment.center,
                            child: Text(
                              '${listPathe[index].tolocation}',
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // Text('${pat[index]}'),
                          const Spacer(),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(8),
                              width: 75,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 77, 117, 137),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Row(
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            // onTap: () {

                            // },
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////
///
///
class Pathe {
  late String fromlocation;
  late String tolocation;
  Pathe(this.fromlocation, this.tolocation);
}
