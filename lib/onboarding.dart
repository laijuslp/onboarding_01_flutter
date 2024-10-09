import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_01/home.dart';
import 'package:onboarding_01/onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 20),
                    child: Column(
                      children: [
                        Text(
                          //    'Talk to the World',
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          contents[i].image,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Home(),
                      ),
                    );
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease);
                },
                child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next"),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
              )),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
    );
  }
}
