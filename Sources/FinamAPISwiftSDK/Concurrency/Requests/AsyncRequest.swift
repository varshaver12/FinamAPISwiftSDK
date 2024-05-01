#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class AsyncRequest<Result>: AsyncApiRequest<ApiClient, Result> {
    
    // MARK: - Сервис работы с торговыми поручениями.
    
    /// Возвращает экземпляр `AsyncRequest` для выставления нового ордера.
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
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) -> AsyncRequest<NewOrderResult> {
        .init {
            try await $0.orders.postOrder(clientID: clientID,
                                          securityBoard: securityBoard,
                                          securityCode: securityCode,
                                          buySell: buySell,
                                          quantity: quantity,
                                          useCredit: useCredit,
                                          price: price,
                                          property: property,
                                          condition: condition,
                                          validBefore: validBefore)
        }
    }
    
    /// Возвращает экземпляр `AsyncRequest` для отмены ордера.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - transactionID: Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func cancelOrder(clientID: String, transactionID: Int32) -> AsyncRequest<CancelOrderResult> {
        .init {
            try await $0.orders.cancelOrder(clientID: clientID,
                                            transactionID: transactionID)
        }
    }
    
    /// Возвращает экземпляр `AsyncRequest` для получения списка ордеров.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - includeMatched: Вернуть исполненные заявки.
    ///     - includeCanceled: Вернуть отмененные заявки.
    ///     - includeActive: Вернуть активные заявки.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) -> AsyncRequest<GetOrdersResult> {
        .init {
            try await $0.orders.getOrders(clientID: clientID,
                                          includeMatched: includeMatched,
                                          includeCanceled: includeCanceled,
                                          includeActive: includeActive)
        }
    }
    
    
    // MARK: - Сервис получения списка инструментов.
    
    /// Возвращает экземпляр `AsyncRequest` для получения информации по инструментам.
    ///
    /// - Parameters:
    ///     - board: Режим торгов
    ///     - seccode: Тикер инструмента.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func getSecurities(board: String?, seccode: String?) -> AsyncRequest<[Security]> {
        .init {
            try await $0.securities.getSecurities(board: board, seccode: seccode)
        }
    }
    
    // MARK: - Сервис работы со стоп-заявками.
    
    /// Возвращает экземпляр `AsyncRequest` для получения списка стоп-ордеров.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - includeExecuted: Вернуть исполненные стоп-ордера.
    ///     - includeCanceled: Вернуть отмененные стоп-ордера.
    ///     - includeActive: Вернуть активные стоп-ордера.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func getStops(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) -> AsyncRequest<GetStopsResult> {
        .init {
            try await $0.stops.getStops(clientID: clientID,
                                        includeExecuted: includeExecuted,
                                        includeCanceled: includeCanceled,
                                        includeActive: includeActive)
        }
    }
    
    /// Возвращает экземпляр `AsyncRequest` для отмены стоп-ордера.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - stopID: Идентификатор стоп-ордера.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func cancelStop(clientID: String, stopID: Int32) -> AsyncRequest<CancelStopResult> {
        .init {
            try await $0.stops.cancelStop(clientID: clientID,
                                          stopID: stopID)
        }
    }
    
    /// Возвращает экземпляр `AsyncRequest` для установки нового стоп-ордера.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - securityBoard: Режим торгов.
    ///     - securityCode: Тикер инструмента.
    ///     - buySell: Направление сделки.
    ///     - stopLoss: Стоп лосс.
    ///     - takeProfit: Тейк профит.
    ///     - linkOrder: Биржевой номер связанной (активной) заявки.
    ///     - validBefore: Время действия заявки.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func newStop(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, stopLoss: StopLoss?, takeProfit: TakeProfit?, expirationDate: Date?, linkOrder: Int64, validBefore: OrderValidBefore?) -> AsyncRequest<NewStopResult> {
        .init {
            try await $0.stops.newStop(clientID: clientID,
                                        securityBoard: securityBoard,
                                        securityCode: securityCode,
                                        buySell: buySell,
                                        stopLoss: stopLoss,
                                        takeProfit: takeProfit,
                                        expirationDate: expirationDate,
                                        linkOrder: linkOrder,
                                        validBefore: validBefore)
        }
    }
    
    // MARK: - Сервис получения структуры портфеля.
    
    /// Возвращает экземпляр `AsyncRequest` для отмены стоп-ордера.
    ///
    /// - Parameters:
    ///     - clientId: Trade Account ID. Идентификатор торгового счёта.
    ///     - content: Какие данные будут в ответе.
    ///
    ///  - Returns: Экземпляр `AsyncRequest`.
    public static func getPortfolio(clientID: String, content: PortfolioContent?) -> AsyncRequest<GetPortfolioResult> {
        .init {
            try await $0.portfolios.getPortfolios(clientID: clientID, content: content)
        }
    }
    
    
}
#endif

