import 'package:flutter/material.dart';
import '../main.dart';

class setings extends StatefulWidget {
  const setings({super.key});

  @override
  State<setings> createState() => _setingsState();
}

class _setingsState extends State<setings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Color.fromARGB(66, 75, 67, 67),
            borderRadius: BorderRadius.circular(45)),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(137, 188, 161, 161))),
            onPressed: () {
              MyApp.of(context)?.toggleTheme();
            },
            child: Text(
              "Change theme to dark ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 22,
              ),
            )),
      ),
    );
  }
}
