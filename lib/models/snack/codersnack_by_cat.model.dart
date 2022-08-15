import 'dart:convert';

CodersnackByCat codersnackByCatFromJson(String str) =>
    CodersnackByCat.fromJson(json.decode(str));

String codersnackByCatToJson(CodersnackByCat data) =>
    json.encode(data.toJson());

class CodersnackByCat {
  int? id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  String? type;
  Title? title;
  Content? content;
  List<Category>? category;
  List<Snack>? snacks;

  CodersnackByCat({
    this.id,
    this.dateGmt,
    this.modifiedGmt,
    this.type,
    this.title,
    this.content,
    this.category,
    this.snacks,
  });

  factory CodersnackByCat.fromJson(Map<String, dynamic> json) =>
      CodersnackByCat(
        id: json["id"],
        dateGmt: DateTime.parse(json["date_gmt"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        type: json["type"],
        title: Title.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        snacks:
            List<Snack>.from(json["snacks"].map((x) => Snack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_gmt": dateGmt?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "type": type,
        "title": title?.toJson(),
        "content": content?.toJson(),
        "category": List.from(category!.map((x) => x.toJson())),
        "snacks": List<dynamic>.from(snacks!.map((x) => x.toJson())),
      };
}

class Category {
  String? header;
  String? description;
  String? jsonFilename;
  ImageCS? image;
  int? id;

  Category({
    this.header,
    this.description,
    this.jsonFilename,
    this.image,
    this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        header: json["header"],
        description: json["description"],
        jsonFilename: json["snacks_by_cat_json_filename"],
        image: ImageCS.fromJson(json["image"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "description": description,
        "jsonFilename": jsonFilename,
        "image": image?.toJson(),
        "id": id,
      };
}

class ImageCS {
  String? guid;

  ImageCS({
    this.guid,
  });

  factory ImageCS.fromJson(Map<String, dynamic> json) => ImageCS(
        guid: json["guid"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
      };
}

class Content {
  String? rendered;
  bool? protected;

  Content({
    this.rendered,
    this.protected,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Snack {
  String? header;
  String? explanation;
  String? references;
  ImageCS? featuredImage;
  List<Quiz>? quizzes;
  int? id;
  Category? category;

  Snack({
    this.header,
    this.explanation,
    this.references,
    this.featuredImage,
    this.quizzes,
    this.id,
    this.category
  });

  factory Snack.fromJson(Map json) {

    // OJO!: Convert json object coming from json file to List for mapping in model class
    List<Quiz> quizzes = [];
    json["quizzes"].forEach((k, value) {
      quizzes.add(Quiz.fromJson(value));
    });

    return Snack(
      header: json["header"],
      explanation: json["explanation"],
      references: json["references"],
      featuredImage: ImageCS.fromJson(json["featured_image"]),
      quizzes: quizzes,
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "header": header,
        "explanation": explanation,
        "references": references,
        "featured_image": featuredImage?.toJson(),
        "quizzes": List<dynamic>.from(quizzes!.map((x) => x.toJson())),
        "id": id,
      };
}

class Quiz {
  String? question;
  String? responseValid;
  String? responseInvalid1;
  String? responseInvalid2;
  int? id;

  Quiz({
    this.question,
    this.responseValid,
    this.responseInvalid1,
    this.responseInvalid2,
    this.id,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        question: json["question"],
        responseValid: json["response_valid"],
        responseInvalid1: json["response_invalid_1"],
        responseInvalid2: json["response_invalid_2"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "response_valid": responseValid,
        "response_invalid_1": responseInvalid1,
        "response_invalid_2": responseInvalid2,
        "id": id,
      };
}

class Title {
  String? rendered;

  Title({
    this.rendered,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
