import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// TODO :  create history page that build from list

// ? this list is from getIt storage of shared preferences with key called 'history'

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

// GlobalKey key = GlobalKey();

class _HistoryPageState extends State<HistoryPage> {
  List<String> users = ["first", "second", "third"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  users.removeAt(index);
                });
              },
              key: GlobalKey(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text(users[index]),
                ),
              ),
            );
          }),
    );
  }
}
