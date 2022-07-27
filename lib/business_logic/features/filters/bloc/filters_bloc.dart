import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/locations/filter_locations_model.dart';

import 'package:ingatlan_figyelo_teszt/repositories/filters/filters_repository_impl.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  final FiltersRepositoryImpl _filtersRepository;
  FiltersBloc(this._filtersRepository) : super(FiltersInitial()) {
    on<FiltersEvent>((event, emit) async {
      emit(FiltersLoadingState());
      try {
        final FilterModel filtersModel =
            await _filtersRepository.getFilters(getDummyFilter());
        emit(FiltersLoadedState(filtersModel));
      } catch (error) {
        emit(FiltersErrorState(error.toString()));
      }
    });
  }

  //Creates a FiltersModel which will be passed to the BE. This will be sent back from BE to the client as a response. Only for temporary testing purposes.

  FilterModel getDummyFilter() {
    return FilterModel(
        isNotificationEnabled: true,
        privateAdvertisersOnly: false,
        filterOutSuspiciousItems: true,
        onlyPolisWithPictures: true,
        nameSpace: "hu",
        locations: [
          FilterLocationsModel(
              accessTokens: ["v1-NGjMb89DhXVjdFH2qe2Y9s9nivaCNaDNCDmkvsdRho"],
              adminLevels: {"6": "Nógrád megye", "8": "Zabar"},
              nameSpace: "hu",
              ids: ["ChIJG2dAGsJwQEcRAHgeDCnEAAQ"]),
          FilterLocationsModel(
              accessTokens: ["v1-lv3CMtHjZyVTRCqNyCEmHsakmSAMa0bpsxi3Wr1QjqE"],
              adminLevels: {"6": "Veszprém", "8": "Csesznek"},
              nameSpace: "hu",
              ids: ["ChIJTZZvGMgqakcRQGAeDCnEAAQ"]),
        ],
        name: "Sus",
        assignmentType: AssignmentType.forSale,
        estateTypes: [EstateTypes.house],
        createTime: 1658740743732,
        usesUmbrella: true,
        id: null,
        minPrice: 69000000,
        maxPrice: 420000000,
        minFloorArea: 80,
        maxFloorArea: null,
        minUnitPrice: null,
        maxUnitPrice: null);
  }
}
