/// Security price sign.
/// Разрешенный знак цены у инструмента.
public enum PriceSign: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Positive.
    /// Положительная цена.
    case positive // = 1

    /// Non negative.
    /// Не отрицательная цена.
    case nonNegative // = 2

    /// Any.
    /// Любая цена, без ограничения на знак.
    case any // = 3

}
