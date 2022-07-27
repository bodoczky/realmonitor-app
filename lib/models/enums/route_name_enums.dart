enum Screen {
  dashboard("/"),
  dataProcessing("/data_processing"),
  results("/results"),
  favorites("/favorites"),
  marketInfo("/market_info"),
  monetaryExtras("/monetary_extras"),
  settings("/settings"),
  profile("/profile");

  final String value;

  const Screen(this.value);
}
