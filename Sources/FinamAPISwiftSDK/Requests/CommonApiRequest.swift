import Foundation

public final class CommonApiRequest<Result>: ApiRequest<CommonApiClient, Result> {

    // MARK: Сервис работы с торговыми поручениями.
    
    /// Возвращает экземпляр `CommonApiRequest` для выставления биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Экземпляр `CommonApiRequest`.
    public static func postOrder(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: BuySell,
        quantity: Int32,
        useCredit: Bool,
        price: Double?,
        property: OrderProperty,
        condition: OrderCondition?,
        validBefore: OrderValidBefore?
    ) -> CommonApiRequest<NewOrderResult> {
        .init {
            try $0.orders.postOrder(clientID: clientID,
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
    
    public static func cancelOrder(clientID: String, transactionID: Int32) -> CommonApiRequest<CancelOrderResult> {
        .init {
            try $0.orders.cancelOrder(clientID: clientID, transactionID: transactionID)
        }
    }
    
    public static func getOrders(clientID: String,
                                 includeMatched: Bool,
                                 includeCanceled: Bool,
                                 includeActive: Bool) -> CommonApiRequest<GetOrdersResult> {
        .init {
            try $0.orders.getOrders(clientID: clientID,
                                    includeMatched: includeMatched,
                                    includeCanceled: includeCanceled,
                                    includeActive: includeActive)
        }
    }
    
    // MARK: Сервис получения списка инструментов.
    
    public static func getSecurities(
        board: String?,
        seccode: String?
    ) -> CommonApiRequest<[Security]> {
        .init {
            try $0.securities.getSecurities(board: board, seccode: seccode)
        }
    }

}
