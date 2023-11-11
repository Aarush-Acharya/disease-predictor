import 'package:cp_project/bindings/initial_bindings.dart';
import 'package:cp_project/submission_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: initialBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DiseaseDetector(),
    );
  }
}

class DiseaseDetector extends StatelessWidget {
  DiseaseDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          const Text(
            'Stark Medical',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 90,
          ),
          Text(
            "Select Your Disease",
            style: TextStyle(
                color: Color.fromARGB(210, 224, 221, 221), fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubmissonScreen(
                              index: 0,
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(18, 213, 213, 213),
                  ),
                  height: 400,
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      SizedBox(
                          height: 300,
                          width: 280,
                          child: FittedBox(
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/brain.jpeg",
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Malaria",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.514)),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubmissonScreen(
                              index: 1,
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(18, 213, 213, 213),
                  ),
                  height: 400,
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      SizedBox(
                          height: 300,
                          width: 280,
                          child: FittedBox(
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/Lung_Cancer.jpeg",
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Thyroid",
                          style: TextStyle(
                              color: Color.fromARGB(131, 255, 255, 255)))
                    ]),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubmissonScreen(
                              index: 2,
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(18, 213, 213, 213),
                  ),
                  height: 400,
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      SizedBox(
                          height: 300,
                          width: 280,
                          child: FittedBox(
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/tb.jpeg",
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Glaucoma",
                          style: TextStyle(
                              color: Color.fromARGB(131, 255, 255, 255)))
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
