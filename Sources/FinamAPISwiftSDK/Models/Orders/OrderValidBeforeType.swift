import Foundation

/// Условие заявки.
public enum OrderValidBeforeType: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Order is valid till the end of the current session.
    /// Заявка действует до конца сессии.
    case tillEndSession // = 1

    /// Order is valid till cancellation.
    /// Заявка действует, пока не будет отменена.
    case tillCancelled // = 2

    /// Order is valid till specified moment. OrderValidBefore.time parameter must be set.
    /// Заявка действует до указанного времени. Параметр OrderValidBefore.time должно быть установлен.
    case exactTime // = 3

}

public struct OrderValidBefore {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    var type: OrderValidBeforeType
    var time: Date

}
