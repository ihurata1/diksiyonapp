import 'package:boilerplate/features/breathe/binding/breathe.dart';
import 'package:boilerplate/features/breathe/view/breathe.dart';
import 'package:boilerplate/features/common_mistakes/binding/common_mistakes.dart';
import 'package:boilerplate/features/common_mistakes/view/common_mistakes.dart';
import 'package:boilerplate/features/confused/binding/confused.dart';
import 'package:boilerplate/features/confused/view/confused.dart';
import 'package:boilerplate/features/counter/binding/counter.dart';
import 'package:boilerplate/features/counter/view/counter.dart';
import 'package:boilerplate/features/foreign_words/binding/foreign_words.dart';
import 'package:boilerplate/features/foreign_words/view/foreign_words.dart';
import 'package:boilerplate/features/hangman/binding/hangman.dart';
import 'package:boilerplate/features/hangman/view/hangman.dart';
import 'package:boilerplate/features/home/view/home.dart';
import 'package:boilerplate/features/proverbs/binding/proverbs.dart';
import 'package:boilerplate/features/proverbs/view/proverbs.dart';
import 'package:boilerplate/features/quiz/binding/quiz.dart';
import 'package:boilerplate/features/quiz/view/quiz.dart';
import 'package:boilerplate/helpers/question_helper/question_helper.dart';
import 'package:boilerplate/route/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.counter,
      page: () => CounterScreen(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: AppRoutes.quiz,
      page: () => QuizScreen(questionList: QuestionHelper.getRandomSyydQuestion()),
      transition: Transition.downToUp,
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.foreignWords,
      page: () => ForeignWordsScreen(),
      transition: Transition.downToUp,
      binding: ForeignWordsBinding(),
    ),
    GetPage(
      name: AppRoutes.commonMistakes,
      page: () => const CommonMistakesScreen(),
      transition: Transition.downToUp,
      binding: CommonMistakesBinding(),
    ),
    GetPage(
      name: AppRoutes.proverbs,
      page: () => const ProverbsScreen(),
      transition: Transition.downToUp,
      binding: ProverbsBinding(),
    ),
    GetPage(
      name: AppRoutes.confused,
      page: () => const ConfusedScreen(),
      transition: Transition.downToUp,
      binding: ConfusedBinding(),
    ),
    GetPage(
      name: AppRoutes.breathe,
      page: () => const BreatheScreen(),
      transition: Transition.downToUp,
      binding: BreatheBinding(),
    ),
    GetPage(
      name: AppRoutes.hangman,
      page: () => HangmanScreen(),
      transition: Transition.downToUp,
      binding: HangmanBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
  ];
}
