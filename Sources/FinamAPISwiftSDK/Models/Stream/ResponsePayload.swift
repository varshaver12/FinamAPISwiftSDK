import Foundation

/// Сообщение с информацией о сделке.
public protocol ResponsePayload: StreamData where StreamDataType == ResponseEvent {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: ResponseEvent { get }
}

internal struct ResponsePayloadModel: ResponsePayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: ResponseEvent
}

internal extension ResponsePayloadModel {
    init(response: Proto_Tradeapi_V1_Event) {
        self.init(
            time: Date(),
            type: .data,
            data: response.response.toModel()
        )
    }
}
