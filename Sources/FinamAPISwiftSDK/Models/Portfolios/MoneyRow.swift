/// Money position.
/// Денежная позиция.
public protocol MoneyRow {
    
    /// Position market.
    /// Рынок позиции.
    var market: Market { get }
    
    /// Currency code.
    /// Код валюты.
    var currency: String { get }
    
    /// Current position.
    /// Текущая позиция.
    var balance: Double { get }
    
}

internal struct MoneyRowModel: MoneyRow {
    var market: Market
    var currency: String
    var balance: Double
}

internal extension MoneyRowModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_MoneyRow) throws {
        self.market = try .new(rawValue: grpcModel.market.rawValue)
        self.currency = grpcModel.currency
        self.balance = grpcModel.balance
    }
}

internal extension Proto_Tradeapi_V1_MoneyRow {
    func toModel() throws -> MoneyRowModel {
        try MoneyRowModel(grpcModel: self)
    }
}
