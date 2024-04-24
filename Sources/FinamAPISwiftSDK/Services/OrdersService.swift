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
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func postOrder(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: OrderDirection,
        quantity: Int32,
        useCredit: Bool,
        price: Double?,
        property: OrderProperty,
        condition: OrderCondition?,
        validBefore: OrderValidBefore?
    ) throws -> EventLoopFuture<OrderInfo>
    
    
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
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func postOrder(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: OrderDirection,
        quantity: Int32,
        useCredit: Bool,
        price: Double?,
        property: OrderProperty,
        condition: OrderCondition?,
        validBefore: OrderValidBefore?
    ) async throws -> OrderInfo

#endif
}

internal struct GrpcOrdersService: OrdersService {
    let client: OrdersServiceClient
    
    init(_ client: OrdersServiceClient) {
        self.client = client
    }
    
    func postOrder(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: OrderDirection,
        quantity: Int32,
        useCredit: Bool,
        price: Double?,
        property: OrderProperty,
        condition: OrderCondition?,
        validBefore: OrderValidBefore?
    ) throws -> EventLoopFuture<OrderInfo> {
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
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func postOrder(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: OrderDirection,
        quantity: Int32,
        useCredit: Bool,
        price: Double?,
        property: OrderProperty,
        condition: OrderCondition?,
        validBefore: OrderValidBefore?
    ) async throws -> OrderInfo {
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
    
#endif
}
