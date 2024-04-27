import Foundation

/// Order.
/// Заявка.
public protocol Order {

  /// Order No. Appear only when an order is placed in OrderBook.
  /// Биржевой номер заявки. Появляется после того, как заявка попадает в стакан.
    var orderNo: Int64 { get }

  /// Transaction Id . Assigned when a command for new order creation is sent.
  /// Идентификатор транзакции. Назначается после подачи команды на создание новой заявки.
    var transactionID: Int32 { get }

  /// Security Code.
  /// Тикер инструмента.
    var securityCode: String { get }

  /// Trade Account ID.
  /// Идентификатор торгового счёта.
    var clientID: String { get }

  /// Order status.
  /// Состояние заявки.
    var status: OrderStatus { get }

  /// Transaction direction.
  /// Направление сделки.
    var buySell: BuySell { get }

  /// Time of Order placement in UTC.
  /// Время регистрации заявки на бирже. В UTC.
    var createdAt: Date? { get }

  /// Lot price.
  /// Цена за лот.
    var price: Double { get }

  /// Volume in lots.
  /// Количество, в лотах.
    var quantity: Int32 { get }

  /// Residual volume in lots.
  /// Неисполненный остаток, в лотах.
    var balance: Int32 { get }

  /// Rejection reason or conditional order resolution.
  /// Причина отказа или вердикт по условной заявке.
    var message: String { get }

  /// Price currency.
  /// Валюта цены.
    var currency: String { get }

  /// Conditional order properties.
  /// Параметры условной заявки.
    var condition: OrderCondition? { get }

  /// Order lifetime.
  /// Время действия заявки.
    var validBefore: OrderValidBefore? { get }

  /// Time of order registration on the server in UTC.
  /// Время, когда заявка была зарегистрирована на сервере. В UTC.
    var acceptedAt: Date? { get }

  /// Security Board.
  /// Основной режим торгов инструмента.
    var securityBoard: String { get }

  /// Market.
  /// Рынок.
    var market: Market { get }

}

internal struct OrderModel: Order {
    var orderNo: Int64
    var transactionID: Int32
    var securityCode: String
    var clientID: String
    var status: OrderStatus
    var buySell: BuySell
    var createdAt: Date?
    var price: Double
    var quantity: Int32
    var balance: Int32
    var message: String
    var currency: String
    var condition: OrderCondition?
    var validBefore: OrderValidBefore?
    var acceptedAt: Date?
    var securityBoard: String
    var market: Market
}

internal extension OrderModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_Order) throws {
        self.orderNo = grpcModel.orderNo
        self.transactionID = grpcModel.transactionID
        self.securityCode = grpcModel.securityCode
        self.clientID = grpcModel.clientID
        self.status = try .new(rawValue: grpcModel.status.rawValue)
        self.buySell = try .new(rawValue: grpcModel.buySell.rawValue)
        self.createdAt = grpcModel.createdAt.date
        self.price = grpcModel.price
        self.quantity = grpcModel.quantity
        self.balance = grpcModel.balance
        self.message = grpcModel.message
        self.currency = grpcModel.currency
        self.condition = try grpcModel.condition.toModel()
        self.validBefore = try grpcModel.validBefore.toModel()
        self.acceptedAt = grpcModel.acceptedAt.date
        self.securityBoard = grpcModel.securityBoard
        self.market = try .new(rawValue: grpcModel.market.rawValue)
    }
}

internal extension Proto_Tradeapi_V1_Order {
    func toModel() throws -> OrderModel {
        try OrderModel(grpcModel: self)
    }
}
