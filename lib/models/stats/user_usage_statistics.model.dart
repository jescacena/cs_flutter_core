import 'package:cs_flutter_core/models/snack/codersnack_by_cat.model.dart';
import 'package:cs_flutter_core/models/stats/snack_read.model.dart';
import 'package:cs_flutter_core/models/stats/snack_test_try.model.dart';

class UserUsageStatisticsModel {
  List<SnackReadModel>? snackReads = [];
  List<Snack>? snackNotReadYet = [];
  List<SnackTestTryModel>? snackTestTries = [];

  UserUsageStatisticsModel({this.snackReads, this.snackNotReadYet, this.snackTestTries});
}
