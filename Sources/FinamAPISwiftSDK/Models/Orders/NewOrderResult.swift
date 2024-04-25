import Foundation

/// Информация о биржевой заявке.
public protocol OrderInfo {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }
    
    /// Transaction Id, which can be used to cancel order or find corresponding order_no in Event service.
    /// Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    var transactionID: Int32 { get }
    
    /// Security Code.
    /// Тикер инструмента.
    var securityCode: String? { get }
    
    /// Order No. Appear only when an order is placed in OrderBook.
    /// Биржевой номер заявки. Появляется после того, как заявка попадает в стакан.
    var orderNo: Int64? { get }
    
    /// Order status.
    /// Состояние заявки.
    var status: OrderStatus? { get }
    
    /// Transaction direction.
    /// Направление сделки.
    var buySell: OrderDirection? { get }
    
    /// Time of Order placement in UTC.
    /// Время регистрации заявки на бирже. В UTC.
    var createdAt: Date? { get }
    
    var hasCreatedAt: Bool? { get }
    
    /// Lot price.
    /// Цена за лот.
    var price: Double? { get }
    
    /// Volume in lots.
    /// Количество, в лотах.
    var quantity: Int32? { get }
    
    /// Residual volume in lots.
    /// Неисполненный остаток, в лотах.
    var balance: Int32? { get }
    
    /// Rejection reason or conditional order resolution.
    /// Причина отказа или вердикт по условной заявке.
    var message: String? { get }
    
    /// Price currency.
    /// Валюта цены.
    var currency: String? { get }
    
    /// Conditional order properties.
    /// Параметры условной заявки.
    var condition: OrderCondition? { get }
    
    /// Returns true if `condition` has been explicitly set.
    var hasCondition: Bool? { get }
    
    /// Order lifetime.
    /// Время действия заявки.
    var validBefore: OrderValidBefore? { get }
    
    /// Returns true if `validBefore` has been explicitly set.
    var hasValidBefore: Bool? { get }
    
    /// Time of order registration on the server in UTC.
    /// Время, когда заявка была зарегистрирована на сервере. В UTC.
    var acceptedAt: Date? { get }
    
    /// Returns true if `acceptedAt` has been explicitly set.
    var hasAcceptedAt: Bool? { get }
    
    /// Security Board.
    /// Основной режим торгов инструмента.
    var securityBoard: String? { get }
    
    /// Market.
    /// Рынок.
    var market: Market? { get }
}

internal struct OrderInfoModel: OrderInfo {
    var clientID: String
    
    var transactionID: Int32
    
    var securityCode: String?
    
    var orderNo: Int64?
    
    var status: OrderStatus?
    
    var buySell: OrderDirection?
    
    var createdAt: Date?
    
    var hasCreatedAt: Bool?
    
    var price: Double?
    
    var quantity: Int32?
    
    var balance: Int32?
    
    var message: String?
    
    var currency: String?
    
    var condition: OrderCondition?
    
    var hasCondition: Bool?
    
    var validBefore: OrderValidBefore?
    
    var hasValidBefore: Bool?
    
    var acceptedAt: Date?
    
    var hasAcceptedAt: Bool?
    
    var securityBoard: String?
    
    var market: Market?
    
}

internal extension OrderInfoModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_NewOrderResult) throws {
        self.clientID = grpcModel.clientID
        self.transactionID = grpcModel.transactionID
        self.securityCode = grpcModel.securityCode
    }
    
    fileprivate init(grpcModel: Proto_Tradeapi_V1_CancelOrderResult) throws {
        self.clientID = grpcModel.clientID
        self.transactionID = grpcModel.transactionID
    }
}

internal extension Proto_Tradeapi_V1_NewOrderResult {
    func toModel() throws -> OrderInfoModel {
        try OrderInfoModel(grpcModel: self)
    }
}

internal extension Proto_Tradeapi_V1_CancelOrderResult {
    func toModel() throws -> OrderInfoModel {
        try OrderInfoModel(grpcModel: self)
    }
}
