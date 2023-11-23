import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // to add scrollview to child column
      child: SingleChildScrollView(
        child: Column(
          // here map() simply means that we map value to a new value
          children: summaryData.map((data) {
            // In this function we return widgets
            // to which this piece of data should be mapped
            return Row(
              children: [
                // here 'as' and '.toString' are used for type casting
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                ),

                // To Fix the ugly warning at the output screen that 'some content
                // does basically not fit into the screen boundaries' , we can fix
                // this issue by wrapping the below column with another widgets
                // and the widget with which it should be wrapped is 'Expanded'
                // widgets
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
