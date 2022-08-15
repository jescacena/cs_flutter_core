import 'package:cs_flutter_core/models/category/category_model.dart';
import 'package:cs_flutter_core/models/snack/snack.model.dart';

class SnackReadModel {
  CS_Snack? snack;
  CS_Category? category;
  int? counter;
  String? dateInISOString;

  SnackReadModel({this.snack, this.category, this.counter, this.dateInISOString});

  @override
  String toString(){
    return 'header-->${snack!.header}, counter:${counter.toString()}';
  }
}
