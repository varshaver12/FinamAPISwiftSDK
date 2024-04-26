/// Тип заявки.
public enum OrderType: Int, Codable {
    
    /// Рыночная.
    case market
    
    /// Лимитная.
    case limit
    
    /// Условная.
    case bestPrice
    
}
