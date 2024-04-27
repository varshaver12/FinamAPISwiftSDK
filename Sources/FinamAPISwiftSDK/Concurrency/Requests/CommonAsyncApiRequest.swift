#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class CommonAsyncApiRequest<Result>: AsyncApiRequest<CommonApiClient, Result> {
    
    // MARK: - Сервис работы с торговыми поручениями.
    
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
    
    
    // MARK: - Сервис получения списка инструментов.
    
    public static func getSecurities(board: String?, seccode: String?) -> CommonAsyncApiRequest<[Security]> {
        .init {
            try await $0.securities.getSecurities(board: board, seccode: seccode)
        }
    }
    
    // MARK: - Сервис работы со стоп-заявками.
    
    public static func getStops(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) -> CommonAsyncApiRequest<GetStopsResult> {
        .init {
            try await $0.stops.getStops(clientID: clientID,
                                        includeExecuted: includeExecuted,
                                        includeCanceled: includeCanceled,
                                        includeActive: includeActive)
        }
    }
    
    public static func cancelStop(clientID: String, stopID: Int32) -> CommonAsyncApiRequest<CancelStopResult> {
        .init {
            try await $0.stops.cancelStop(clientID: clientID,
                                          stopID: stopID)
        }
    }
    
    public static func newStop(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, stopLoss: StopLoss?, takeProfit: TakeProfit?, expirationDate: Date?, linkOrder: Int64, validBefore: OrderValidBefore?) -> CommonAsyncApiRequest<NewStopResult> {
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
    
    
}
#endif

