import 'package:flutter/material.dart';
import 'package:herry_up/core/data/service/shortbathresp.dart';

TextEditingController sourcename = TextEditingController();
TextEditingController targetname = TextEditingController();

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: sourcename,
              decoration: InputDecoration(
                hintText: 'Frome',
                labelText: 'Frome',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            TextField(
              controller: targetname,
              decoration: InputDecoration(
                hintText: 'To',
                labelText: 'To',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await ShortestPath(
                  sourcename.toString(),
                  targetname.toString(),
                );
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      title: SizedBox(
                        height: 400,
                        width: 500,
                        child: Column(
                          children: [
                            const Text(
                              'body',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(x),
                          ],
                        ),
                      ),
                      content: const Icon(Icons.send),
                      actions: <Widget>[
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF9775FA)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(200, 50),
                ),
              ),
              child: const Text(
                'Loge in',
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
