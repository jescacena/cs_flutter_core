
import 'package:cs_flutter_core/models/quiz/QuizRadioValues.enum.dart';
import 'package:cs_flutter_core/models/quiz/QuizResponseStatus.enum.dart';

class SnackQuizzResponse {
  String? text;
  QuizzRadioValuesEnum? value;
  bool? selected;
  QuizzResponseStatus? status;

  SnackQuizzResponse({this.text, this.value, this.selected, this.status});
}
