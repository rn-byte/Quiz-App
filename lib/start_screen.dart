import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  // 'CONST' HELP DART OPTIMIZE THE
  // RUN TIME PERFORMANCE

  final void Function() startQuiz; //the given argument is of type function

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //For Adding Opacity to the image. There are Two main
          //ways of doing that.

          // 1st Approach(Not Recommended)
          //For that you shoud wrap this image widget with another widgets. Not
          //the widget which is suggested here but instead we can use the
          //Generic wrap with Widget Refactoring there and then we can enter
          //the widget name manually and in this case it is 'Opacity' widget
          // Opacity widget not only need 'child' argument but also need 'opacity'
          //argument

          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ),

          // 2nd Approach(Recommended)
          // For an image you can set the opacity usig color argument and
          // changing the transparency of that color will change the opacity of
          // the image.
          //The color argument also helps in adding overlay color to the image.
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(179, 253, 252, 252),
          ),

          const SizedBox(
            height: 40,
          ),
          Text(
            "Learn Flutter The Fun Way !",
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 201, 153, 251),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          //to access alternative constructor function provided by the
          //flutter we need to add dot (.) and name of the function required
          OutlinedButton.icon(
            onPressed: startQuiz, //Anoynomous function
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),

            icon: const Icon(Icons.arrow_right_alt_outlined),

            // icon need 'Label' in place of child
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
