/// Направление операции.
public enum OrderDirection: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Sell.
    /// Продажа.
    case sell // = 1

    /// Buy.
    /// Покупка.
    case buy // = 2
}
