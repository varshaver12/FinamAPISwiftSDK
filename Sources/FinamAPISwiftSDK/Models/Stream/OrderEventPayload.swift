import Foundation

/// Сообщение с информацией о стакане.
public protocol OrderEventPayload: StreamData where StreamDataType == OrderEvent {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: OrderEvent { get }
}

internal struct OrderEventPayloadModel: OrderEventPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: OrderEvent
}

internal extension OrderEventPayloadModel {
    init(response: Proto_Tradeapi_V1_Event) {
        self.init(
            time: Date(),
            type: .data,
            data: response.order.toModel()
        )
    }
}
