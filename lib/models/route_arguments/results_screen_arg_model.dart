import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

class ResultsScreenArgModel {
  String? title;
  ResultsScreenArgModel({this.title});
}

class NewIdeasScreenArgModel {
  FilterModel model;
  NewIdeasScreenArgModel({required this.model});
}
