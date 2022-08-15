
import 'package:cs_flutter_core/models/category/category_model.dart';
import 'package:cs_flutter_core/models/snack/snack.model.dart';

class CS_SnacksByCat {
  int? id;
  DateTime? dateGmt;
  DateTime? modifiedGmt;
  CS_Category? category;
  CS_Snack? snack;

  CS_SnacksByCat({
    this.id,
    this.dateGmt,
    this.modifiedGmt,
    this.category,
    this.snack,
  });
}