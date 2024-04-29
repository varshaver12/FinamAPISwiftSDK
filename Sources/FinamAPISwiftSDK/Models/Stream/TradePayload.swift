import Foundation

/// Сообщение с информацией о сделке.
public protocol TradePayload: StreamData where StreamDataType == TradeEvent {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: TradeEvent { get }
}

internal struct TradePayloadModel: TradePayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: TradeEvent
}

internal extension TradePayloadModel {
    init(response: Proto_Tradeapi_V1_Event) {
        self.init(
            time: Date(),
            type: .data,
            data: response.trade.toModel()
        )
    }
}
