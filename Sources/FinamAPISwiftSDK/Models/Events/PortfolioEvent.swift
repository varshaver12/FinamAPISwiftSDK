/// Portfolio event.
/// Событие портфеля.
public protocol PortfolioEvent {
    /// Trade Account ID.
    /// Идентификатор торгового счёта.
    var clientID: String { get }
    /// What kind of data portfolio event contains.
    /// Какие данные находятся в событии портфеля.
    var content: PortfolioContent { get }
    /// Current equity, RUB.
    /// Текущая оценка портфеля в рублях.
    var equity: Double { get }
    /// Open Equity, RUB.
    /// Входящая оценка портфеля в рублях.
    var balance: Double { get }
    /// DEPO positions.
    /// Позиции DEPO.
    var positions: [PositionRow] { get }
    /// Currency positions.
    /// Валютные позиции.
    var currencies: [CurrencyRow] { get }
    /// Money positions.
    /// Денежные позиции.
    var money: [MoneyRow] { get }
    
}

internal struct PortfolioEventModel: PortfolioEvent {
    var clientID: String
    var content: PortfolioContent
    var equity: Double
    var balance: Double
    var positions: [PositionRow]
    var currencies: [CurrencyRow]
    var money: [MoneyRow]
}

internal extension PortfolioEventModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_PortfolioEvent) throws {
        self.clientID = grpcModel.clientID
        self.content = grpcModel.content.toModel()
        self.equity = grpcModel.equity
        self.balance = grpcModel.balance
        self.positions = try grpcModel.positions.map { try $0.toModel() }
        self.currencies = grpcModel.currencies.map { $0.toModel() }
        self.money = try grpcModel.money.map { try $0.toModel() }
    }
}

internal extension Proto_Tradeapi_V1_PortfolioEvent {
    func toModel() throws -> PortfolioEventModel {
        try PortfolioEventModel(grpcModel: self)
    }
}
