import Foundation

/// Сообщение с информацией о стакане.
public protocol OrderBookPayload: StreamData where StreamDataType == OrderBookEvent {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: OrderBookEvent { get }
}

internal struct OrderBookPayloadModel: OrderBookPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: OrderBookEvent
}

internal extension OrderBookPayloadModel {
    init(response: Proto_Tradeapi_V1_Event) {
        self.init(
            time: Date(),
            type: .data,
            data: response.orderBook.toModel()
        )
    }
}
