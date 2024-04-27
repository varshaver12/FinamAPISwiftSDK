/// Currency position.
/// Валютная позиция.
public protocol CurrencyRow {
    
    /// Currency code.
    /// Код валюты.
    var name: String { get }
    
    /// Current position.
    /// Текущая позиция.
    var balance: Double { get }
    
    /// Currency rate for RUB.
    /// Курс валюты к рублю.
    var crossRate: Double { get }
    
    /// Equity in RUB.
    /// Оценка в рублях.
    var equity: Double { get }
    
    /// Unrealized P/L, in RUB.
    /// Нереализованные прибыль/убытки в рублях.
    var unrealizedProfit: Double { get }
    
}

internal struct CurrencyRowModel: CurrencyRow {
    var name: String
    var balance: Double
    var crossRate: Double
    var equity: Double
    var unrealizedProfit: Double
}

internal extension CurrencyRowModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_CurrencyRow) {
        self.name = grpcModel.name
        self.balance = grpcModel.balance
        self.crossRate = grpcModel.crossRate
        self.equity = grpcModel.equity
        self.unrealizedProfit = grpcModel.unrealizedProfit
    }
}

internal extension Proto_Tradeapi_V1_CurrencyRow {
    func toModel() -> CurrencyRowModel {
        CurrencyRowModel(grpcModel: self)
    }
}
