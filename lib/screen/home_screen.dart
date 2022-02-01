import 'package:flutter/material.dart';
import 'package:telemedicine/screen/p_calculator.dart';
import 'package:telemedicine/screen/p_e_w_list.dart';
import 'package:telemedicine/service/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> title = ["Pregnancy every week", "Pregnancy Due Calculator"];
    final user = Auth();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const pregnancyEveryWeek()),
                  );
                },
                child: Container(
                  height: 100,
                  width: 250,
                  padding: const EdgeInsets.all(8),
                  child: const Text('pregnancy Every Week',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  color: Colors.redAccent,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 1
                  user.logout();
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
