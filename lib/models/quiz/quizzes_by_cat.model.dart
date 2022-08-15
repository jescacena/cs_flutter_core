
import 'package:cs_flutter_core/models/category/category_model.dart';
import 'package:cs_flutter_core/models/quiz/quiz.model.dart';
import 'package:cs_flutter_core/models/snack/snack.model.dart';

class CS_QuizzesByCatAndSnack {
  int? id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  CS_Category? category;
  CS_Snack? snack;
  CS_Quiz? quiz;

  CS_QuizzesByCatAndSnack({
    this.id,
    this.dateGmt,
    this.modifiedGmt,
    this.category,
    this.snack,
    this.quiz,
  });
}