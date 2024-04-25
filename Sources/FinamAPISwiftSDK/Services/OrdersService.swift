import NIOCore
import Foundation

/// Сервис работы с торговыми поручениями.
public protocol OrdersService {
    /// Выставляет биржевую заявку.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - securityBoard: Торговая доска, на которой размещается ордер (например, "TQBR").
    ///     - securityCode: Код ценной бумаги (например, "SBER").
    ///     - buySell: Тип сделки (покупка или продажа). Возможные значения: "BUY_SELL_BUY" (покупка) или "BUY_SELL_SELL" (продажа).
    ///     - quantity: Количество ценных бумаг.
    ///     - useCredit: Использовать кредит. Недоступно для срочного рынка.
    ///     - price: Цена заявки. Используйте nil, чтобы выставить рыночную заявку.
    ///     - property: Свойства исполнения частично исполненных заявок.
    ///     - condition: Свойства выставления заявок.
    ///     - validBefore: Условие по времени действия заявки.
    ///
    /// - Returns: Информация о выставлении поручения `NewOrderResult`.
    func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) throws -> EventLoopFuture<NewOrderResult>
    
    /// Отменяет биржевую заявку.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - transactionID: Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    ///
    /// - Returns: Информация об отмене ордера `CancelOrderResult`.
    func cancelOrder(clientID: String, transactionID: Int32) throws -> EventLoopFuture<CancelOrderResult>
    
    /// Возвращает список заявок.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - includeMatched: Вернуть исполненные заявки.
    ///     - includeCanceled: Вернуть отмененные заявки.
    ///     - includeActive: Вернуть активные заявки.
    ///
    /// - Returns: Список ордеров `GetOrdersResult`.
    func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) throws -> EventLoopFuture<GetOrdersResult>
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Выставляет биржевую заявку.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - securityBoard: Торговая доска, на которой размещается ордер (например, "TQBR").
    ///     - securityCode: Код ценной бумаги (например, "SBER").
    ///     - buySell: Тип сделки (покупка или продажа). Возможные значения: "BUY_SELL_BUY" (покупка) или "BUY_SELL_SELL" (продажа).
    ///     - quantity: Количество ценных бумаг.
    ///     - useCredit: Использовать кредит. Недоступно для срочного рынка.
    ///     - price: Цена заявки. Используйте nil, чтобы выставить рыночную заявку.
    ///     - property: Свойства исполнения частично исполненных заявок.
    ///     - condition: Свойства выставления заявок.
    ///     - validBefore: Условие по времени действия заявки.
    ///
    /// - Returns: Информация о выставлении поручения `NewOrderResult`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) async throws -> NewOrderResult
    
    /// Отменяет биржевую заявку.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - transactionID: Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    ///
    /// - Returns: Информация об отмене ордера `CancelOrderResult`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func cancelOrder(clientID: String, transactionID: Int32) async throws -> CancelOrderResult
    
    /// Возвращает список заявок.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - includeMatched: Вернуть исполненные заявки.
    ///     - includeCanceled: Вернуть отмененные заявки.
    ///     - includeActive: Вернуть активные заявки.
    ///
    /// - Returns: Список ордеров `GetOrdersResult`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) async throws -> GetOrdersResult
#endif
}

internal struct GrpcOrdersService: OrdersService {
    
    let client: OrdersServiceClient
    
    init(_ client: OrdersServiceClient) {
        self.client = client
    }
    
    func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) throws -> EventLoopFuture<NewOrderResult> {
        self.client
            .newOrder(
                try .new(clientID: clientID,
                         securityBoard: securityBoard,
                         securityCode: securityCode,
                         buySell: buySell,
                         quantity: quantity,
                         useCredit: useCredit,
                         price: price,
                         property: property,
                         condition: condition,
                         validBefore: validBefore)
            )
            .response
            .map { $0.toModel() }
    }
    
    func cancelOrder(clientID: String, transactionID: Int32) throws -> EventLoopFuture<CancelOrderResult> {
        self.client
            .cancelOrder(
                try .new(clientID: clientID, transactionID: transactionID)
            )
            .response
            .map { $0.toModel() }
    }
    
    func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) throws -> EventLoopFuture<GetOrdersResult> {
        self.client
            .getOrders(
                try .new(clientID: clientID,
                         includeMatched: includeMatched,
                         includeCanceled: includeCanceled,
                         includeActive: includeActive)
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) async throws -> NewOrderResult {
        try await self.client
            .newOrder(
                try .new(clientID: clientID,
                         securityBoard: securityBoard,
                         securityCode: securityCode,
                         buySell: buySell,
                         quantity: quantity,
                         useCredit: useCredit,
                         price: price,
                         property: property,
                         condition: condition,
                         validBefore: validBefore)
            )
            .toModel()
    }
    
    func cancelOrder(clientID: String, transactionID: Int32) async throws -> CancelOrderResult {
        try await self.client
            .cancelOrder(
                try .new(clientID: clientID, transactionID: transactionID)
            )
            .toModel()
    }
    
    func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) async throws -> GetOrdersResult {
        try await self.client
            .getOrders(
                try .new(clientID: clientID,
                         includeMatched: includeMatched,
                         includeCanceled: includeCanceled,
                         includeActive: includeActive)
            )
            .toModel()
    }
    
#endif
}
