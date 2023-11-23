import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// class _QuizState extends State<Quiz> {
//   //Widget activeScreen = StartScreen(switchScreen);
// // We're getting this error here because I am using switchScreen here
// // And this basically happens at the same point of time
// // where this method here is created.
// // And therefore it happens too early,
// // both this variable initialization
// // and this method creation here
// // happens when this class is turned into an object.
// // So you could say these lines here
// // happen almost simultaneously
// // and therefore here, it's too early
// // to reference this switchScreen method
// // because essentially it's not guaranteed that it exists yet

// //
// // Well, the best way of working around that
// // is to add another method here, to this QuizState class.
// // And that would be the built-in initState method

//   Widget? activeScreen;

//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }
// // when that state object is created for the first time.
// // initState will execute once
// // after this object has been created.
// // And therefore in here you can indeed use all these variables
// // and also reference this switchScreen function, for example.
// // But initState will then never execute thereafter again,
// // which makes this the perfect place for some
// // general initialization work.

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(221, 47, 35, 219),
//                 Color.fromARGB(221, 77, 74, 114),
//                 Color.fromARGB(221, 140, 133, 238),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }

// ALTERNATIVE WAY OF RENDERING DIFFERENT SCREEN CONDITIONALLY
// using ternary operator

// class _QuizState extends State<Quiz> {
//   var activeScreen = 'start-screen';

//   // @override
//   // void initState() {
//   //   activeScreen = StartScreen(switchScreen);
//   //   super.initState();
//   // }

//   void switchScreen() {
//     setState(() {
//       //activeScreen = const QuestionsScreen();
//       activeScreen = 'question-screen';
//     });
//   }

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(221, 47, 35, 219),
//                 Color.fromARGB(221, 77, 74, 114),
//                 Color.fromARGB(221, 140, 133, 238),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           // using conditional statement to switch between screen
//           child: activeScreen == 'start-screen'
//               ? StartScreen(switchScreen)
//               : const QuestionsScreen(),
//         ),
//       ),
//     );
//   }
// }

// ALTERNATIVE WAY OF RENDERING DIFFERENT SCREEN CONDITIONALLY
// using if statement

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  void choosenAnswers(String answers) {
    selectedAnswers.add(answers);

    // once we ran out of question
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidgets = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidgets = QuestionsScreen(onSelectAnswer: choosenAnswers);
      //we have to pass 'chooseAnswers' as a value to question Screen
      // here we choose answer by its name without parenthesis to pass a
      //pointer to that function to question screen
      //here choose answer get executed whenever answer get
      //picked in question-screen and for that we must accept this function
    }

    if (activeScreen == 'result-screen') {
      screenWidgets = ResultScreen(
        choosenAnswers: selectedAnswers,
        restartBtn: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(221, 47, 35, 219),
                Color.fromARGB(221, 77, 74, 114),
                Color.fromARGB(221, 140, 133, 238),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // using conditional statement to switch between screen
          child: screenWidgets,
        ),
      ),
    );
  }
}
