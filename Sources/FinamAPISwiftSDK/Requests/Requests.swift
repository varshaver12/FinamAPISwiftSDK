import Foundation
import SwiftProtobuf

// MARK: - SecuritiesServiceRequests

internal extension Grpc_Tradeapi_V1_GetSecuritiesRequest {
    init(board: String?, seccode: String?) throws {
        if let board = board { self.board = Google_Protobuf_StringValue(stringLiteral: board) }
        if let seccode = seccode { self.seccode = Google_Protobuf_StringValue(stringLiteral: seccode) }
    }
    
    static func new(board: String?, seccode: String?) throws -> Self {
        try .init(board: board, seccode: seccode)
    }
}

// MARK: - OrdersServiceRequests

internal extension Proto_Tradeapi_V1_NewOrderRequest {
    init(
        clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?
    ) throws {
        self.clientID = clientID
        self.securityBoard = securityBoard
        self.securityCode = securityCode
        self.buySell = try .new(rawValue: buySell.rawValue)
        self.quantity = quantity
        self.useCredit = useCredit
        if let price = price { self.price = price.toGoogleProtobufDoubleValue() }
        self.property = try .new(rawValue: property.rawValue)
        if let condition = condition {
            var protoOrderCondition = Proto_Tradeapi_V1_OrderCondition()
            protoOrderCondition.price = condition.price
            protoOrderCondition.type = try .new(rawValue: condition.type.rawValue)
            if let time = condition.time { protoOrderCondition.time = SwiftProtobuf.Google_Protobuf_Timestamp(date: time) }
            self.condition = protoOrderCondition
        }
        if let validBefore = validBefore {
            var protoValidBefore = Proto_Tradeapi_V1_OrderValidBefore()
            protoValidBefore.type = try .new(rawValue: validBefore.type.rawValue)
            if let time = validBefore.time { protoValidBefore.time = SwiftProtobuf.Google_Protobuf_Timestamp(date: time) }
            self.validBefore = protoValidBefore
        }
        
    }
    
    static func new(
        clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, quantity: Int32, useCredit: Bool, price: Double?, property: OrderProperty, condition: OrderCondition?, validBefore: OrderValidBefore?
    ) throws -> Self {
        try .init(clientID: clientID,
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

internal extension Proto_Tradeapi_V1_CancelOrderRequest {
    init(clientID: String, transactionID: Int32) throws {
        self.clientID = clientID
        self.transactionID = transactionID
    }
    static func new(clientID: String, transactionID: Int32) throws -> Self {
        try .init(clientID: clientID,
                  transactionID: transactionID)
    }
}

internal extension Proto_Tradeapi_V1_GetOrdersRequest {
    init(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) throws {
        self.clientID = clientID
        self.includeMatched = includeMatched
        self.includeCanceled = includeCanceled
        self.includeActive = includeActive
    }
    static func new(clientID: String, includeMatched: Bool, includeCanceled: Bool, includeActive: Bool) throws -> Self {
        try .init(clientID: clientID,
                  includeMatched: includeMatched,
                  includeCanceled: includeCanceled,
                  includeActive: includeActive
        )
    }
}

// MARK: - StopsServiceRequests

internal extension Proto_Tradeapi_V1_GetStopsRequest {
    init(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) throws {
        self.clientID = clientID
        self.includeExecuted = includeExecuted
        self.includeCanceled = includeCanceled
        self.includeActive = includeActive
    }
    
    static func new(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) throws -> Self {
        try .init(clientID: clientID,
                  includeExecuted: includeExecuted,
                  includeCanceled: includeCanceled,
                  includeActive: includeActive)
    }
}

internal extension Proto_Tradeapi_V1_CancelStopRequest {
    init(clientID: String, stopID: Int32) throws {
        self.clientID = clientID
        self.stopID = stopID
    }
    
    static func new(clientID: String, stopID: Int32) throws -> Self {
        try .init(clientID: clientID,
                  stopID: stopID)
    }
}

internal extension Proto_Tradeapi_V1_NewStopRequest {
    init(clientID: String,
         securityBoard: String,
         securityCode: String,
         buySell: BuySell,
         stopLoss: StopLoss?,
         takeProfit: TakeProfit?,
         expirationDate: Date?,
         linkOrder: Int64,
         validBefore: OrderValidBefore?) throws {
        print("Proto_Tradeapi_V1_NewStopRequest go")
        self.clientID = clientID
        self.securityBoard = securityBoard
        self.securityCode = securityCode
        self.buySell = try .new(rawValue: buySell.rawValue)
        if let stopLoss = stopLoss { self.stopLoss = try stopLoss.forRequest() }
        if let takeProfit = takeProfit { self.takeProfit = try takeProfit.forRequest() }
        if let date = expirationDate { self.expirationDate = SwiftProtobuf.Google_Protobuf_Timestamp(date: date) }
        self.linkOrder = linkOrder
        if let validBefore = validBefore { self.validBefore = try validBefore.forRequest() }
        print("Proto_Tradeapi_V1_NewStopRequest done")
    }
    
    static func new(clientID: String,
                    securityBoard: String,
                    securityCode: String,
                    buySell: BuySell,
                    stopLoss: StopLoss?,
                    takeProfit: TakeProfit?,
                    expirationDate: Date?,
                    linkOrder: Int64,
                    validBefore: OrderValidBefore?) throws -> Self {
        
        try .init(clientID: clientID,
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
