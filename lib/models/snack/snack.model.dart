import 'package:cs_flutter_core/models/category/category_model.dart';
import 'package:cs_flutter_core/models/quiz/quiz.model.dart';

class CS_Snack {
  int? id;

  String? header;
  String? explanation;
  String? references;
  String? featuredImage;
  List<CS_Quiz>? quizzes;
  CS_Category? category;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  String? image;
  String? weblink;

  CS_Snack(
      {this.id,
      this.dateGmt,
      this.modifiedGmt,
      this.header,
      this.explanation,
      this.references,
      this.featuredImage,
      this.quizzes,
      this.image,
      this.weblink,
      this.category});
}
