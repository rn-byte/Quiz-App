import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_items.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      // to add scrollview to child column
      child: SingleChildScrollView(
        child: Column(
          // here map() simply means that we map value to a new value
          children: summaryData.map((data) {
            // In this function we return widgets
            // to which this piece of data should be mapped
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
