import Foundation

/// Order.
/// Заявка.
public struct Order {

  /// Order No. Appear only when an order is placed in OrderBook.
  /// Биржевой номер заявки. Появляется после того, как заявка попадает в стакан.
  var orderNo: Int64

  /// Transaction Id . Assigned when a command for new order creation is sent.
  /// Идентификатор транзакции. Назначается после подачи команды на создание новой заявки.
  var transactionID: Int32

  /// Security Code.
  /// Тикер инструмента.
  var securityCode: String

  /// Trade Account ID.
  /// Идентификатор торгового счёта.
  var clientID: String

  /// Order status.
  /// Состояние заявки.
  var status: OrderStatus

  /// Transaction direction.
  /// Направление сделки.
  var buySell: BuySell

  /// Time of Order placement in UTC.
  /// Время регистрации заявки на бирже. В UTC.
  var createdAt: Date

  /// Lot price.
  /// Цена за лот.
  var price: Double

  /// Volume in lots.
  /// Количество, в лотах.
  var quantity: Int32

  /// Residual volume in lots.
  /// Неисполненный остаток, в лотах.
  var balance: Int32

  /// Rejection reason or conditional order resolution.
  /// Причина отказа или вердикт по условной заявке.
  var message: String

  /// Price currency.
  /// Валюта цены.
  var currency: String

  /// Conditional order properties.
  /// Параметры условной заявки.
  var condition: OrderCondition

  /// Order lifetime.
  /// Время действия заявки.
  var validBefore: OrderValidBefore

  /// Time of order registration on the server in UTC.
  /// Время, когда заявка была зарегистрирована на сервере. В UTC.
  var acceptedAt: Date

  /// Security Board.
  /// Основной режим торгов инструмента.
  var securityBoard: String

  /// Market.
  /// Рынок.
  var market: Market

}

internal extension Order {
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
    func toModel() throws -> Order {
        try Order(grpcModel: self)
    }
}
