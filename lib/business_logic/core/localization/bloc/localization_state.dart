part of 'localization_bloc.dart';

abstract class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState({required this.locale});

  @override
  List<Object> get props => [];
}

class ChangeLocalization extends LocalizationState {
  const ChangeLocalization({required super.locale});
}

class LocalizationReset extends LocalizationState {
  const LocalizationReset({required super.locale});
}
