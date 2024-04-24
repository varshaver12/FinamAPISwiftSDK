/// Условие заявки.
public enum OrderProperty: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// The residual of partially matched order is to stay in OrderBook.
    /// Неисполненная часть заявки помещается в очередь заявок биржи.
    case putInQueue // = 1

    /// The residual of partially matched order is to be cancelled.
    /// Неисполненная часть заявки снимается с торгов.
    case cancelBalance // = 2

    /// Filling the order only in case the posibility of immediate and full execution.
    /// Сделки совершаются только в том случае, если заявка может быть удовлетворена полностью и сразу при выставлении.
    case immOrCancel // = 3

}
