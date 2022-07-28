import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:mockito/mockito.dart';

class MockNavigation extends Mock implements NavigationBloc {}

void main() {
  late Screen testScreen1;
  late Screen testScreen2;
  late Screen resultsScreen;
  late Object? testArgs;
  late ResultsScreenArgModel resultsScreenArgModel;

  setUp(() {
    testScreen1 = Screen.settings;
    testScreen2 = Screen.profile;
    resultsScreen = Screen.results;
    resultsScreenArgModel = ResultsScreenArgModel(title: "Test");
    testArgs = {};
  });

  group('FiltersBloc', () {
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationPopped" state when adding "NavigationEventPop" event ',
      build: () {
        return NavigationBloc();
      },
      act: (bloc) => bloc.add(NavigationEventPop()),
      expect: () => [
        NavigationPopped(),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationDone" state when adding "NavigationEventAdd" event ',
      build: () => NavigationBloc(),
      act: (bloc) => bloc.add(NavigationEventAdd(testScreen1, testArgs)),
      expect: () => [
        NavigationDone(testScreen1, testArgs),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationDone" state once when adding twice "NavigationEventAdd" event with same parameter ',
      build: () => NavigationBloc(),
      act: (bloc) {
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
      },
      expect: () => [
        NavigationDone(testScreen1, testArgs),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationDone" state twice when adding twice "NavigationEventAdd" event with different target screen',
      build: () => NavigationBloc(),
      act: (bloc) {
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventAdd(testScreen2, testArgs));
      },
      expect: () => [
        NavigationDone(testScreen1, testArgs),
        NavigationDone(testScreen2, testArgs),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationDone" and "NavigationPopped" state alternately when navigating back and forth',
      build: () => NavigationBloc(),
      act: (bloc) {
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventPop());
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
      },
      expect: () => [
        NavigationDone(testScreen1, testArgs),
        NavigationPopped(),
        NavigationDone(testScreen1, testArgs),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit "NavigationDone" and "NavigationPopped" state alternately when navigating back and forth using duplications.',
      build: () => NavigationBloc(),
      act: (bloc) {
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventPop());
        bloc.add(NavigationEventPop());
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventAdd(testScreen1, testArgs));
        bloc.add(NavigationEventAdd(testScreen2, testArgs));
      },
      expect: () => [
        NavigationDone(testScreen1, testArgs),
        NavigationPopped(),
        NavigationDone(testScreen1, testArgs),
        NavigationDone(testScreen2, testArgs),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'emit proper "NavigationDone" state when using custom screen argumentum model',
      build: () => NavigationBloc(),
      act: (bloc) {
        bloc.add(NavigationEventAdd(resultsScreen, resultsScreenArgModel));
      },
      expect: () => [
        NavigationDone(resultsScreen, resultsScreenArgModel),
      ],
    );
  });
}
