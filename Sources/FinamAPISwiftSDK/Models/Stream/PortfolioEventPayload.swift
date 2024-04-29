import Foundation

/// Сообщение с информацией о стакане.
public protocol PortfolioEventPayload: StreamData where StreamDataType == PortfolioEvent {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: PortfolioEvent { get }
}

internal struct PortfolioEventPayloadModel: PortfolioEventPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: PortfolioEvent
}

internal extension PortfolioEventPayloadModel {
    init(response: Proto_Tradeapi_V1_Event) {
        self.init(
            time: Date(),
            type: .data,
            data: response.portfolio.toModel()
        )
    }
}
