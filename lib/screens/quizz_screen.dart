import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions_example.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/ui/shared/color.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  int _timeLeft = 120; // set the initial time in seconds
  Timer? _timer = null;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _controller = PageController(initialPage: 0);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          // TODO: Handle time up event
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body:
      Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Text('Time Left: $_timeLeft seconds',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold, ),)),

              Expanded(
                child: PageView.builder(
                  controller: _controller!,
                  onPageChanged: (page) {
                    if (page == questions.length - 1) {
                      setState(() {
                        btnText = "See Results";
                      });
                    }
                    setState(() {
                      answered = false;
                    });
                  },
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Question ${index + 1}/10",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 200.0,
                          child: Text(
                            "${questions[index].question}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        for (int i = 0; i < questions[index].answers!.length; i++)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            margin: EdgeInsets.only(
                                bottom: 20.0, left: 12.0, right: 12.0),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: btnPressed
                                  ? questions[index].answers!.values.toList()[i]
                                      ? Colors.green
                                      : Colors.red
                                  : AppColor.secondaryColor,
                              onPressed: !answered
                                  ? () {
                                      if (questions[index]
                                          .answers!
                                          .values
                                          .toList()[i]) {
                                        score++;
                                        print("yes");
                                      } else {
                                        print("no");
                                      }
                                      setState(() {
                                        btnPressed = true;
                                        answered = true;
                                      });
                                    }
                                  : null,
                              child: Text(questions[index].answers!.keys.toList()[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )),
                            ),
                          ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (_controller!.page?.toInt() == questions.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(score)));
                            } else {
                              _controller!.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInExpo);

                              setState(() {
                                btnPressed = false;
                              });
                            }
                          },
                          shape: StadiumBorder(),
                          fillColor: Colors.blue,
                          padding: EdgeInsets.all(18.0),
                          elevation: 0.0,
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: questions.length,
                ),
              ),
            ],
          )),
    );
  }
}
