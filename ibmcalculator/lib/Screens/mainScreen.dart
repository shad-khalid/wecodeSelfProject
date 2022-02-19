import 'package:flutter/material.dart';
import 'package:ibmcalculator/Screens/secondScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  double sliderValue = 125.0;
  bool mailClick = true;
  bool femaliClick = true;
  int weightValue = 60;
  int ageValue = 25;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 40, 41, 59),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 40, 41, 59),
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            maleFemaleButton(),
            slider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                weightContainer(),
                ageContainer(),
              ],
            ),
            calculateContainer(context)
          ],
        )),
      ),
    );
  }
  // ------------------------------------ methods-------------------------------

  Container calculateContainer(BuildContext context) {
    return Container(
      width: 366,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.pink[400]),
      child: TextButton(
          onPressed: () {
            setState(() {});

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => hee(
                          age: ageValue,
                          height: sliderValue.toInt(),
                          weight: weightValue,
                        )));
          },
          child: Text(
            'CALCULATE',
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
    );
  }

  Container ageContainer() {
    return Container(
      width: 160,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 50, 51, 73),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AGE',
            style: TextStyle(color: Colors.grey[500], fontSize: 18),
          ),
          Text(
            ageValue.toString(),
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "btn3",
                child: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    ageValue--;
                  });
                },
                backgroundColor: Color.fromARGB(255, 63, 64, 90),
              ),
              FloatingActionButton(
                heroTag: "btn4",
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    ageValue++;
                  });
                },
                backgroundColor: Color.fromARGB(255, 63, 64, 90),
              )
            ],
          )
        ],
      ),
    );
  }

  Container weightContainer() {
    return Container(
      width: 160,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 50, 51, 73),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WEIGHT ',
            style: TextStyle(color: Colors.grey[500]),
          ),
          Text(
            weightValue.toString(),
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                child: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    weightValue--;
                  });
                },
                backgroundColor: Color.fromARGB(255, 63, 64, 90),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    weightValue++;
                  });
                },
                backgroundColor: Color.fromARGB(255, 63, 64, 90),
              )
            ],
          )
        ],
      ),
    );
  }

  Column slider() {
    return Column(
      children: [
        Container(
          width: 366,
          height: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 50, 51, 73),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT ',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sliderValue.round().toString(),
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                  Text(
                    '\ncm',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Slider(
                  min: 0,
                  max: 250,
                  value: sliderValue,
                  activeColor: Colors.pink[400],
                  inactiveColor: Colors.white,
                  label: sliderValue.round().toString(),
                  onChanged: (double val) {
                    setState(() {
                      sliderValue = val;
                    });
                  }),
            ],
          ),
        )
      ],
    );
  }

  Row maleFemaleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
              color: (mailClick == false)
                  ? Color.fromARGB(255, 63, 64, 90) //activated
                  : Color.fromARGB(255, 50, 51, 73), //deactivated

              borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            onPressed: () {
              setState(() {
                mailClick = false;
                femaliClick = true;
              });
            },
            icon: Icon(
              Icons.male,
              size: 120,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
              color: (femaliClick == false)
                  ? Color.fromARGB(255, 63, 64, 90) //activated
                  : Color.fromARGB(255, 50, 51, 73), //deactivated
              borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            onPressed: () {
              setState(() {
                femaliClick = false;
                mailClick = true;
              });
            },
            icon: Icon(
              Icons.female,
              size: 120,
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
