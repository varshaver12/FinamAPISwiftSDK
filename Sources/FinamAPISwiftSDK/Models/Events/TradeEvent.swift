import Foundation
/// Trade event.
/// Событие со сделкой.
public protocol TradeEvent {
  /// Security Code.
  /// Тикер инструмента.
    var securityCode: String { get }
  /// Trade No.
  /// Номер сделки.
    var tradeNo: Int64 { get }
  /// Order No.
  /// Номер заявки.
    var orderNo: Int64 { get }
  /// Trade Account ID.
  /// Идентификатор торгового счёта.
    var clientID: String { get }
  /// Time of trade registration on stock exchange in UTC.
  /// Время исполнения сделки на бирже. В UTC.
    var createdAt: Date { get }
  /// Volume in lots.
  /// Количество, в лотах.
    var quantity: Int64 { get }
  /// Trade Price.
  /// Цена сделки.
    var price: Double { get }
  /// Trade currency value.
  /// Объём сделки в валюте инструмента.
    var value: Double { get }
  /// Transaction direction.
  /// Направление сделки.
    var buySell: BuySell { get }
  /// Fee, RUB.
  /// Комиссия, в рублях.
    var commission: Double { get }
  /// Trade currency.
  /// Валюта сделки.
    var currency: String { get }
  /// Accrued interest.
  /// НКД сделки.
    var accruedInterest: Double { get }

}

internal struct TradeEventModel: TradeEvent {
    var securityCode: String
    var tradeNo: Int64
    var orderNo: Int64
    var clientID: String
    var createdAt: Date
    var quantity: Int64
    var price: Double
    var value: Double
    var buySell: BuySell
    var commission: Double
    var currency: String
    var accruedInterest: Double
}

internal extension TradeEventModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_TradeEvent) throws {
        self.securityCode = grpcModel.securityCode
        self.tradeNo = grpcModel.tradeNo
        self.orderNo = grpcModel.orderNo
        self.clientID = grpcModel.clientID
        self.createdAt = grpcModel.createdAt.date
        self.quantity = grpcModel.quantity
        self.price = grpcModel.price
        self.value = grpcModel.value
        self.buySell = try .new(rawValue: grpcModel.buySell.rawValue)
        self.commission = grpcModel.commission
        self.currency = grpcModel.currency
        self.accruedInterest = grpcModel.accruedInterest
    }
}

internal extension Proto_Tradeapi_V1_TradeEvent {
    func toModel() throws -> TradeEventModel {
        try TradeEventModel(grpcModel: self)
    }
}
