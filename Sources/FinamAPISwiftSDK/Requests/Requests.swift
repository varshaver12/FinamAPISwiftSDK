import Foundation
import SwiftProtobuf
// MARK: - OrdersServiceRequests

internal extension Proto_Tradeapi_V1_NewOrderRequest {
    init(
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
            protoOrderCondition.time = SwiftProtobuf.Google_Protobuf_Timestamp(date: condition.time)
            self.condition = protoOrderCondition
        }
        if let validBefore = validBefore { 
            var protoValidBefore = Proto_Tradeapi_V1_OrderValidBefore()
            protoValidBefore.type = try .new(rawValue: validBefore.type.rawValue)
            protoValidBefore.time = SwiftProtobuf.Google_Protobuf_Timestamp(date: validBefore.time)
            self.validBefore = protoValidBefore
        }

    }

    static func new(
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
