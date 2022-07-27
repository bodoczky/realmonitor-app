import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

abstract class FiltersRepository {
  Future<FilterModel> getFilters(FilterModel filterModel);
}
