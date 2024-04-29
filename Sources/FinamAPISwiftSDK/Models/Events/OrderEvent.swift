import Foundation
/// Order event.
/// Событие с заявкой.
public protocol OrderEvent {
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
    var createdAt: Date { get }
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
    /// Валюта цены инструмента.
    var currency: String { get }
    /// Conditional order properties.
    /// Параметры условной заявки.
    var condition: OrderCondition { get }
    /// Order lifetime.
    /// Время действия заявки.
    var validBefore: OrderValidBefore { get }
    /// Time of order registration on the server in UTC.
    /// Время, когда заявка была зарегистрирована на сервере. В UTC.
    var acceptedAt: Date { get }
    
}

internal struct OrderEventModel: OrderEvent {
    var orderNo: Int64
    var transactionID: Int32
    var securityCode: String
    var clientID: String
    var status: OrderStatus
    var buySell: BuySell
    var createdAt: Date
    var price: Double
    var quantity: Int32
    var balance: Int32
    var message: String
    var currency: String
    var condition: OrderCondition
    var validBefore: OrderValidBefore
    var acceptedAt: Date
    
}

internal extension OrderEventModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_OrderEvent) {
        self.orderNo = grpcModel.orderNo
        self.transactionID = grpcModel.transactionID
        self.securityCode = grpcModel.securityCode
        self.clientID = grpcModel.clientID
        self.createdAt = grpcModel.createdAt.date
        self.price = grpcModel.price
        self.quantity = grpcModel.quantity
        self.balance = grpcModel.balance
        self.message = grpcModel.message
        self.currency = grpcModel.currency
        self.condition = grpcModel.condition.toModel()
        self.validBefore = grpcModel.validBefore.toModel()
        self.acceptedAt = grpcModel.acceptedAt.date
        do {
            self.status = try .new(rawValue: grpcModel.status.rawValue)
        } catch {
            self.status = .unspecified
        }
        do {
            self.buySell = try .new(rawValue: grpcModel.buySell.rawValue)
        } catch {
            self.buySell = .unspecified
        }
    }
}

internal extension Proto_Tradeapi_V1_OrderEvent {
    func toModel() -> OrderEventModel {
        OrderEventModel(grpcModel: self)
    }
}
