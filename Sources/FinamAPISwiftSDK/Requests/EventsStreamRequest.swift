/// Запрос на поток предоставления биржевой информации.
public final class EventsStreamRequest {
    private var orderBookSubscribe: [Proto_Tradeapi_V1_OrderBookSubscribeRequest]
    private var orderBookUnsubscribe: [Proto_Tradeapi_V1_OrderBookUnsubscribeRequest]
    private var tradesSubscribe: [Proto_Tradeapi_V1_OrderTradeSubscribeRequest]
    private var tradesUnsubscribe: [Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest]
    private var keepAliveRequest: [Proto_Tradeapi_V1_KeepAliveRequest]
    
    public init() {
        self.orderBookSubscribe = []
        self.orderBookUnsubscribe = []
        self.tradesSubscribe = []
        self.tradesUnsubscribe = []
        self.keepAliveRequest = []
    }
}

// MARK: - Подписка на биржевой стакан

public extension EventsStreamRequest {
    
    private func addOrderBookSubscribeRequest(_ request: Proto_Tradeapi_V1_OrderBookSubscribeRequest) -> Void {
        if let existingIndex = orderBookSubscribe.firstIndex(where: { $0.securityCode == request.securityCode }) {
                orderBookSubscribe[existingIndex] = request
            } else {
                orderBookSubscribe.append(request)
            }
    }
    
    static func orderBookSubscribe(requestID: String, securityCode: String, securityBoard: String) -> EventsStreamRequest {
        let request = EventsStreamRequest()
        request.orderBookSubscribe.append(
            Proto_Tradeapi_V1_OrderBookSubscribeRequest(requestID: requestID,
                                                        securityCode: securityCode,
                                                        securityBoard: securityBoard)
        )
        return request
    }
    
    func orderBookSubscribe(requestID: String, securityCode: String, securityBoard: String) -> EventsStreamRequest {
        addOrderBookSubscribeRequest(
            Proto_Tradeapi_V1_OrderBookSubscribeRequest(requestID: requestID,
                                                        securityCode: securityCode,
                                                        securityBoard: securityBoard)
        )
        return self
    }
}

internal extension Proto_Tradeapi_V1_OrderBookSubscribeRequest {
    init(requestID: String, securityCode: String, securityBoard: String) {
        self.requestID = requestID
        self.securityBoard = securityBoard
        self.securityCode = securityCode
    }
}

// MARK: - Удаление подписки на биржевой стакан

public extension EventsStreamRequest {
    
    private func addOrderBookUnsubscribeRequest(_ request: Proto_Tradeapi_V1_OrderBookUnsubscribeRequest) -> Void {
        if let existingIndex = orderBookUnsubscribe.firstIndex(where: { $0.securityCode == request.securityCode }) {
            orderBookUnsubscribe[existingIndex] = request
        } else {
            orderBookUnsubscribe.append(request)
        }
    }
    
    static func orderBookUnsubscribe(requestID: String, securityCode: String, securityBoard: String) -> EventsStreamRequest {
        let request = EventsStreamRequest()
        request.orderBookUnsubscribe.append(
            Proto_Tradeapi_V1_OrderBookUnsubscribeRequest(requestID: requestID,
                                                          securityCode: securityCode,
                                                          securityBoard: securityBoard)
        )
        return request
    }
    
    func orderBookUnsubscribe(requestID: String, securityCode: String, securityBoard: String) -> EventsStreamRequest {
        addOrderBookUnsubscribeRequest(
            Proto_Tradeapi_V1_OrderBookUnsubscribeRequest(requestID: requestID,
                                                          securityCode: securityCode,
                                                          securityBoard: securityBoard)
        )
        return self
    }
}

internal extension Proto_Tradeapi_V1_OrderBookUnsubscribeRequest {
    init(requestID: String, securityCode: String, securityBoard: String) {
        self.requestID = requestID
        self.securityBoard = securityBoard
        self.securityCode = securityCode
    }
}

// MARK: - Подписка на заявки и сделки

public extension EventsStreamRequest {
    
    private func addTradesSubscribeRequest(_ request: Proto_Tradeapi_V1_OrderTradeSubscribeRequest) -> Void {
        if let existingIndex = tradesSubscribe.firstIndex(where: { $0.requestID == request.requestID }) {
            tradesSubscribe[existingIndex] = request
        } else {
            tradesSubscribe.append(request)
        }
    }
    
    static func tradesSubscribe(requestID: String, includeTrades: Bool, includeOrders: Bool, clientIds: [String]) -> EventsStreamRequest {
        let request = EventsStreamRequest()
        request.tradesSubscribe.append(
            Proto_Tradeapi_V1_OrderTradeSubscribeRequest(requestID: requestID,
                                                         includeTrades: includeTrades,
                                                         includeOrders: includeOrders,
                                                         clientIds: clientIds)
        )
        return request
    }
    
    func tradesSubscribe(requestID: String, includeTrades: Bool, includeOrders: Bool, clientIds: [String]) -> EventsStreamRequest {
        addTradesSubscribeRequest(
            Proto_Tradeapi_V1_OrderTradeSubscribeRequest(requestID: requestID,
                                                         includeTrades: includeTrades,
                                                         includeOrders: includeOrders,
                                                         clientIds: clientIds)
        )
        return self
    }
}

internal extension Proto_Tradeapi_V1_OrderTradeSubscribeRequest {
    init(requestID: String, includeTrades: Bool, includeOrders: Bool, clientIds: [String]) {
        self.requestID = requestID
        self.includeTrades = includeTrades
        self.includeOrders = includeOrders
        self.clientIds = clientIds
    }
}

// MARK: - Удаление подписки на заявки и сделки

public extension EventsStreamRequest {
    
    private func addTradesUnsubscribeRequest(_ request: Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest) -> Void {
        if let existingIndex = tradesUnsubscribe.firstIndex(where: { $0.requestID == request.requestID }) {
            tradesUnsubscribe[existingIndex] = request
        } else {
            tradesUnsubscribe.append(request)
        }
    }

    
    static func tradesUnsubscribe(requestID: String) -> EventsStreamRequest {
        let request = EventsStreamRequest()
        request.tradesUnsubscribe.append(
            Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest(requestID: requestID)
        )
        return request
    }
    
    func tradesUnsubscribe(requestID: String) -> EventsStreamRequest {
        addTradesUnsubscribeRequest(
            Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest(requestID: requestID)
        )
        return self
    }
}

internal extension Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest {
    init(requestID: String) {
        self.requestID = requestID
    }
}

// MARK: - Keep-Alive

public extension EventsStreamRequest {
    
    private func addKeepAliveRequest(_ request: Proto_Tradeapi_V1_KeepAliveRequest) -> Void {
        if let existingIndex = keepAliveRequest.firstIndex(where: { $0.requestID == request.requestID }) {
            keepAliveRequest[existingIndex] = request
        } else {
            keepAliveRequest.append(request)
        }
    }
    
    static func keepAliveRequest(requestID: String) -> EventsStreamRequest {
        let request = EventsStreamRequest()
        request.keepAliveRequest.append(
            Proto_Tradeapi_V1_KeepAliveRequest(requestID: requestID)
        )
        return request
    }
    
    func keepAliveRequest(requestID: String) -> EventsStreamRequest {
        addKeepAliveRequest(
            Proto_Tradeapi_V1_KeepAliveRequest(requestID: requestID)
        )
        return self
    }
}

internal extension Proto_Tradeapi_V1_KeepAliveRequest {
    init(requestID: String) {
        self.requestID = requestID
    }
}

internal extension EventsStreamRequest {
    func transformToRequestsForCall() -> [Proto_Tradeapi_V1_SubscriptionRequest] {
        var requests: [Proto_Tradeapi_V1_SubscriptionRequest] = []
        for orderBookSubscribeRequest in orderBookSubscribe {
            requests.append(
                Proto_Tradeapi_V1_SubscriptionRequest(orderBookSubscribe: orderBookSubscribeRequest)
            )
        }
        for orderBookUnsubscribeRequest in orderBookUnsubscribe {
            requests.append(
                Proto_Tradeapi_V1_SubscriptionRequest(orderBookUnsubscribe: orderBookUnsubscribeRequest)
            )
        }
        for orderTradeSubscribe in tradesSubscribe {
            requests.append(
                Proto_Tradeapi_V1_SubscriptionRequest(orderTradeSubscribe: orderTradeSubscribe)
            )
        }
        for orderTradeUnsubscribeRequest in tradesUnsubscribe {
            requests.append(
                Proto_Tradeapi_V1_SubscriptionRequest(orderTradeUnsubscribe: orderTradeUnsubscribeRequest)
            )
        }
        for keepAliveRequest in keepAliveRequest {
            requests.append(
                Proto_Tradeapi_V1_SubscriptionRequest(keepAlive: keepAliveRequest)
            )
        }
        
        return requests
    }
}

internal extension Proto_Tradeapi_V1_SubscriptionRequest {
    init(orderBookSubscribe: Proto_Tradeapi_V1_OrderBookSubscribeRequest) {
        self.orderBookSubscribeRequest = orderBookSubscribe
    }
    init(orderBookUnsubscribe: Proto_Tradeapi_V1_OrderBookUnsubscribeRequest) {
        self.orderBookUnsubscribeRequest = orderBookUnsubscribe
    }
    init(orderTradeSubscribe: Proto_Tradeapi_V1_OrderTradeSubscribeRequest) {
        self.orderTradeSubscribeRequest = orderTradeSubscribe
    }
    init(orderTradeUnsubscribe: Proto_Tradeapi_V1_OrderTradeUnsubscribeRequest) {
        self.orderTradeUnsubscribeRequest = orderTradeUnsubscribe
    }
    init(keepAlive: Proto_Tradeapi_V1_KeepAliveRequest) {
        self.keepAliveRequest = keepAlive
    }
    
}
