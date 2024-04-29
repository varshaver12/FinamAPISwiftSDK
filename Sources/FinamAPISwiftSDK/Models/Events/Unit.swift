public enum Unit: Int, Codable {
  /// Value is not specified. Do not use.
  /// Значение не указано. Не использовать.
  case unspecified // = 0

  /// Munute.
  /// Минута.
  case minute // = 1

  /// Hour.
  /// Час.
  case hour // = 2

  /// Day.
  /// День.
  case day // = 3

  /// Week.
  /// Неделя.
  case week // = 4

  /// Month.
  /// Месяц.
  case month // = 5

  /// Quarter.
  /// Квартал.
  case quarter // = 6

  /// Year.
  /// Год.
  case year // = 7

}
