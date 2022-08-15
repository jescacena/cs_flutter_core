import 'dart:convert';

import 'package:cs_flutter_core/models/category/category_model.dart';
import 'package:cs_flutter_core/models/quiz/quiz.model.dart';
import 'package:cs_flutter_core/models/quiz/quizzes_by_cat.model.dart';
import 'package:cs_flutter_core/models/snack/snack.model.dart';
import 'package:cs_flutter_core/models/snack/snacks_by_cat.model.dart';
import 'package:http/http.dart' as http;
import '../constants.dart' as Constants;

String categoriesUrl =
    Constants.jsonFilesUrlBasePath + Constants.categoriesJsonFilename;

Future<http.Response> fetchCategories() {
  return http.get(Uri.parse(categoriesUrl));
}

List<CS_Category> mapJsonResponseToCategoryList(response) {
  final List<CS_Category> result = [];

  final List listData = json.decode(response.body);

  listData.forEach((item) {
    // print('JES category item-->' + item.toString());
    result.add(mapJsonResponseToCategory(item));
  });

  return result;
}

List<CS_SnacksByCat> mapJsonResponseToSnacksByCatList(response) {
  final List<CS_SnacksByCat> result = [];

  final List listData = json.decode(response);

  listData.forEach((item) {
    // print('JES snacks_by_cat item-->' + item.toString());
    CS_Snack snack = mapJsonResponseToSnack(item["codersnack"]);
    CS_Category category =
        mapJsonResponseToCategory(item["codersnacks_category"]);
    snack.category = category;
    result.add(CS_SnacksByCat(
        id: item["id"],
        dateGmt: DateTime.parse(item["created_at"]),
        modifiedGmt: DateTime.parse(item["updated_at"]),
        snack: snack,
        category: category));
  });

  return result;
}

int mapJsonResponseToQuizzesCount(response) {
  final Map objResponse = json.decode(response);

  return objResponse['count'];
}

CS_Category mapJsonResponseToCategory(jsonResponse) {
  return CS_Category(
      id: jsonResponse["id"],
      dateGmt: DateTime.parse(jsonResponse["created_at"]),
      modifiedGmt: DateTime.parse(jsonResponse["updated_at"]),
      key: jsonResponse["key"],
      image: jsonResponse["image_url"],
      header: jsonResponse["header"],
      snacksByCatJsonFilename: jsonResponse["snacks_by_cat_json_filename"],
      description: cleanTextForMarkdownRender(jsonResponse["description"]));
}

CS_Snack mapJsonResponseToSnack(jsonResponse) {
  return CS_Snack(
      id: jsonResponse["id"],
      dateGmt: DateTime.parse(jsonResponse["created_at"]),
      modifiedGmt: DateTime.parse(jsonResponse["updated_at"]),
      header: jsonResponse["header"],
      explanation: cleanTextForMarkdownRender(jsonResponse["explanation"]),
      references: jsonResponse["references"],
      image: jsonResponse["featured_image_url"],
      weblink: jsonResponse["weblink"]);
}

CS_Quiz mapJsonResponseToQuiz(jsonResponse) {
  return CS_Quiz(
      id: jsonResponse["id"],
      dateGmt: DateTime.parse(jsonResponse["created_at"]),
      modifiedGmt: DateTime.parse(jsonResponse["updated_at"]),
      question: jsonResponse["question"],
      responseValid: jsonResponse["response_valid"],
      responseInvalid1: jsonResponse["response_invalid1"],
      responseInvalid2: jsonResponse["response_invalid2"]);
}

Future<http.Response> fetchQuizzesCountByCat(String catKey) {
  String targetUrl =
      Constants.jsonFilesUrlBasePath + catKey + '.quizzes-count.json';
  return http.get(Uri.parse(targetUrl));
}

Future<http.Response> fetchSnacksByCat(jsonFilename) {
  String targetUrl = Constants.jsonFilesUrlBasePath + jsonFilename;
  return http.get(Uri.parse(targetUrl));
}

Future<http.Response> fetchQuizzesByCat(String catKey) {
  String targetUrl = Constants.jsonFilesUrlBasePath + catKey + '.quizzes.json';
  return http.get(Uri.parse(targetUrl));
}

List<CS_QuizzesByCatAndSnack> mapJsonResponseToQuizzesByCatList(response) {
  final List<CS_QuizzesByCatAndSnack> result = [];

  final List listData = json.decode(response);

  listData.forEach((item) {
    // print('JES quizzes_asocs item-->' + item.toString());
    CS_Snack snack = mapJsonResponseToSnack(item["codersnack"]);
    CS_Category category =
        mapJsonResponseToCategory(item["codersnacks_category"]);
    CS_Quiz quiz = mapJsonResponseToQuiz(item["codersnacks_quiz"]);
    snack.category = category;
    result.add(CS_QuizzesByCatAndSnack(
        id: item["id"],
        dateGmt: DateTime.parse(item["created_at"]),
        modifiedGmt: DateTime.parse(item["updated_at"]),
        snack: snack,
        category: category,
        quiz: quiz));
  });

  return result;
}

String cleanTextForMarkdownRender(String text) {
  return text.replaceAll('â', '\'');
}
