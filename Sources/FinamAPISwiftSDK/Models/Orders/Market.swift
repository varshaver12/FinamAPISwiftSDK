/// Рынок.
public enum Market: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified  = 0

    /// Moscow Exchange Stock market.
    /// Фондовый рынок Московской Биржи.
    case stock  = 1

    /// Moscow Exchange Derivative market.
    /// Срочный рынок Московской Биржи.
    case forts  = 4

    /// Saint-Petersburg Exchange.
    /// Санкт-Петербургская биржа.
    case spbex  = 7

    /// US Stock market.
    /// Фондовый рынок США.
    case mma  = 14

    /// Moscow Exchange Currency market.
    /// Валютный рынок Московской Биржи.
    case ets  = 15

    /// Moscow Exchange Bond market.
    /// Долговой рынок Московской Биржи.
    case bonds  = 20

    /// Moscow Exchange option market.
    /// Рынок опционов Московской Биржи.
    case options  = 21

}
