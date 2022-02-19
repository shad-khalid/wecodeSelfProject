import 'package:flutter/material.dart';

class hee extends StatelessWidget {
  const hee(
      {Key? key, required this.age, required this.height, required this.weight})
      : super(key: key);
  final int age;
  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    double total = ((weight) / ((height * 0.01) * (height * 0.01)));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 41, 59),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            yourResultContainer(),
            resultContainer(total),
            reCalculateContainer(context),
          ],
        ),
      ),
    );
  }

  Container yourResultContainer() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Your Result  ",
          style: TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container resultContainer(double total) {
    return Container(
      width: 380,
      height: 590,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 63, 64, 90)),
      child: checking(total),
    );
  }

  Container reCalculateContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 366,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.pink[400]),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text(
            'RE-CALCULATE ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          )),
    );
  }
}

Column checking(double total) {
  if (total > 18.5 && total < 25) {
    return normalPerson(total);
  } else if (total > 30 && total < 35) {
    return obese1(total);
  } else if (total > 35 && total < 40) {
    return obese2(total);
  } else if (total > 40) {
    return obese3(total);
  } else if (total > 16 && total < 17) {
    return moderateThinness(total);
  } else if (total > 25 && total < 30) {
    return overweight(total);
  } else if (total > 17 && total < 18.5) {
    return mildThinness(total);
  } else {
    return severeThinness(total);
  }
}
//----------------------------------methods---------------------------------------------

Column severeThinness(double total) {
  return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Text(
      'Severe thinness',
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.red, fontSize: 25),
    ),
    Text(
      total.toStringAsFixed(1),
      style: TextStyle(fontSize: 55, color: Colors.white),
    ),
    Text(
      'You are Underweight and you must eat something',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 22),
    )
  ]);
}

Column mildThinness(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Mild thinness',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.yellow, fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'not bad just eat something and you will be Normal',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column overweight(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Overweight',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.yellow, fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'your body weight is overWaiighted\nbecarefull',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column moderateThinness(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Moderate thinness',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.pink[200], fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'you need to eat something',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column obese3(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Obese Class III',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.red, fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'you need to start training ',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column obese2(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Obese Class II',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.pink[200], fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'you have to start training ',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column obese1(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Obese Class I',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.pink[200], fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'you need to start training ',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}

Column normalPerson(double total) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'Normal',
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.green, fontSize: 25),
      ),
      Text(
        total.toStringAsFixed(1),
        style: TextStyle(fontSize: 55, color: Colors.white),
      ),
      Text(
        'You have a normal body weight.\nGood job!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 22),
      )
    ],
  );
}
