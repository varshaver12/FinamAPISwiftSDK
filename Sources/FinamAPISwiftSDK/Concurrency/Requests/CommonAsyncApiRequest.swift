#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class CommonAsyncApiRequest<Result>: AsyncApiRequest<CommonApiClient, Result> {
 
    // MARK: Сервис работы с торговыми поручениями.
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для выставления биржевой заявки.
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
    /// - Returns: Экземпляр `CommonAsyncApiRequest`.
    public static func postOrder(
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
    ) -> CommonAsyncApiRequest<OrderInfo> {
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
 
}
#endif
