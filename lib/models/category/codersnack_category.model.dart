import 'dart:convert';

CodersnackCategory codersnackCategoryFromJson(String str) =>
    CodersnackCategory.fromJson(json.decode(str));

String codersnackCategoryToJson(CodersnackCategory data) =>
    json.encode(data.toJson());

class CodersnackCategory {
  int? id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  ImageCS? image;
  Title? title;
  Content? content;
  String? header;
  String? snacksByCatJsonFilename;  
  String? description;

  CodersnackCategory({
    this.id,
    this.dateGmt,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.image,
    this.title,
    this.content,
    this.header,
    this.snacksByCatJsonFilename,
    this.description,
  });

  factory CodersnackCategory.fromJson(Map<String, dynamic> json) =>
      new CodersnackCategory(
        id: json["id"],
        dateGmt: DateTime.parse(json["date_gmt"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        image: ImageCS.fromJson(json["image"]),
        title: Title.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        header: json["header"],
        snacksByCatJsonFilename: json["snacks_by_cat_json_filename"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_gmt": dateGmt?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "image": image?.toJson(),
        "title": title?.toJson(),
        "content": content?.toJson(),
        "header": header,
        "snacks_by_cat_json_filename": snacksByCatJsonFilename,
        "description": description,
      };
}

class ImageCS {
  String? guid;

  ImageCS({
    this.guid,
  });

  factory ImageCS.fromJson(Map<String, dynamic> json) => new ImageCS(
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

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Title {
  String? rendered;

  Title({
    this.rendered,
  });

  factory Title.fromJson(Map<String, dynamic> json) => new Title(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
