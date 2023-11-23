// This class acts as the Blueprint for the DATA[contains question blueprint]
// in this class you can define which kind of data you can store and which kind
// of additional logic you can put in there.
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // creates copy of list 'answers
    shuffledList.shuffle();
    return shuffledList;
  }
}
