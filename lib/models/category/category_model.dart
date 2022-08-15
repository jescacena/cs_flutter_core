class CS_Category {
  int id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  String? key;
  String? status;
  String? type;
  String? image;
  String? header;
  String? snacksByCatJsonFilename;  
  String? description;
  int? quizzesCount;
  bool? isMarkedAsTOI;  // Is  marked as topic of interest

  CS_Category({
    this.id = 0,
    this.dateGmt,
    this.modifiedGmt,
    this.key,
    this.status,
    this.type,
    this.image,
    this.header,
    this.snacksByCatJsonFilename,
    this.description,
    this.quizzesCount,
    this.isMarkedAsTOI = true
  });
}  