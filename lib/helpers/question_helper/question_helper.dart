import 'package:boilerplate/features/confused/model/confused.dart';
import 'package:boilerplate/features/quiz/model/question.dart';
import 'package:boilerplate/features/quiz/model/syyd.dart';

class QuestionHelper {
  static List<Question> getRandomSyydQuestion() {
    SyydModel.dataSyyd?.shuffle();

    List<SyydModel> syydQuestions = SyydModel.dataSyyd!.sublist(0, 10);
    List<Question> questions = [];
    for (var item in syydQuestions) {
      questions.add(Question(
        question: "Hangisi Doğrudur?",
        choices: {item.dogruKelime!: true, item.yanlisKelime!: false},
      ));
    }
    return questions;
  }

  static List<Question> getRandomConfusedWordsQuestion() {
    ConfusedModel.dataConfused?.shuffle();
    List<ConfusedModel> confusedQuestions = ConfusedModel.dataConfused!.sublist(0, 10);
    List<Question> questions = [];
    for (var item in confusedQuestions) {
      questions.add(Question(
        question: "Hangisi Doğrudur?",
        choices: {item.dogru!: true, item.yanlis!: false},
      ));
    }
    return questions;
  }
}
