#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class CommonAsyncApiRequest<Result>: AsyncApiRequest<CommonApiClient, Result> {
    
    // MARK: Сервис работы с торговыми поручениями.
    
    public static func postOrder(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?) -> CommonAsyncApiRequest<NewOrderResult> {
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
    
    public static func cancelOrder(clientID: String, transactionID: Int32) -> CommonAsyncApiRequest<CancelOrderResult> {
        .init {
            try await $0.orders.cancelOrder(clientID: clientID,
                                            transactionID: transactionID)
        }
    }
    
    public static func getOrders(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) -> CommonAsyncApiRequest<GetOrdersResult> {
        .init {
            try await $0.orders.getOrders(clientID: clientID,
                                          includeMatched: includeMatched,
                                          includeCanceled: includeCanceled,
                                          includeActive: includeActive)
        }
    }
    
    
    // MARK: Сервис получения списка инструментов.
    
    public static func getSecurities(board: String?, seccode: String?) -> CommonAsyncApiRequest<[Security]> {
        .init {
            try await $0.securities.getSecurities(board: board, seccode: seccode)
        }
    }
}
#endif

