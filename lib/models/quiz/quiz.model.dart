
import 'package:cs_flutter_core/models/quiz/QuizStatus.enum.dart';

class CS_Quiz {
  String? question;
  String? responseValid;
  String? responseInvalid1;
  String? responseInvalid2;
  int? id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  QuizzStatus? status;

  CS_Quiz({
    this.question,
    this.responseValid,
    this.responseInvalid1,
    this.responseInvalid2,
    this.id,
    this.dateGmt,
    this.modifiedGmt,
    this.status
  });
}
