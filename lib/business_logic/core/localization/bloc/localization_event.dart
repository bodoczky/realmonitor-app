part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  final Locale locale;
  const LocalizationEvent(this.locale);

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends LocalizationEvent {
  const ChangeLocaleEvent(super.locale);
}

class ResetLocaleEvent extends LocalizationEvent {
  const ResetLocaleEvent(super.locale);
}
