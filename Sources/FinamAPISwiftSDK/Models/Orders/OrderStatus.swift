/// Направление операции.
public enum OrderStatus: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Order is not in OrderBook.
    /// Заявка не выставлена.
    case none // = 1

    /// Order is in OrderBook.
    /// Заявка выставлена.
    case active // = 2

    /// Order is canceled.
    /// Заявка отменена.
    case cancelled // = 3

    /// Order is matched.
    /// Заявка исполнена.
    case matched // = 4
}
