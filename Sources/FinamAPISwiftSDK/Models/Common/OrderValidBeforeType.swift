import Foundation
import SwiftProtobuf

/// Условие заявки.
public enum OrderValidBeforeType: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Order is valid till the end of the current session.
    /// Заявка действует до конца сессии.
    case tillEndSession // = 1

    /// Order is valid till cancellation.
    /// Заявка действует, пока не будет отменена.
    case tillCancelled // = 2

    /// Order is valid till specified moment. OrderValidBefore.time parameter must be set.
    /// Заявка действует до указанного времени. Параметр OrderValidBefore.time должно быть установлен.
    case exactTime // = 3

}

public struct OrderValidBefore: Codable {
    var type: OrderValidBeforeType
    var time: Date?
    
    public init(type: OrderValidBeforeType, time: Date?) {
        self.type = type
        self.time = time
    }
}

internal extension OrderValidBefore {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_OrderValidBefore) throws {
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.time = grpcModel.time.date
    }
    
    func forRequest() throws -> Proto_Tradeapi_V1_OrderValidBefore {
        var grpcModel = Proto_Tradeapi_V1_OrderValidBefore()
        grpcModel.type = try .new(rawValue: type.rawValue)
        if let time = time { grpcModel.time = SwiftProtobuf.Google_Protobuf_Timestamp(date: time) }
        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_OrderValidBefore {
    func toModel() throws -> OrderValidBefore {
        try OrderValidBefore(grpcModel: self)
    }
}
