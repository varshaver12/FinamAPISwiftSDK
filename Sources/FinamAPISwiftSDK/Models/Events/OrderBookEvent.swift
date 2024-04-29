/// OrderBook event.
/// Событие стакана.
public protocol OrderBookEvent {
  /// Security Code.
  /// Тикер инструмента.
    var securityCode: String { get }
  /// Trading Board.
  /// Режим торгов.
    var securityBoard: String { get }
  /// Asks.
  /// Заявки на продажу.
    var asks: [OrderBookRow] { get }
  /// Bids.
  /// Заявки на покупку.
    var bids: [OrderBookRow] { get }

}

internal struct OrderBookEventModel: OrderBookEvent {
    var securityCode: String
    var securityBoard: String
    var asks: [OrderBookRow]
    var bids: [OrderBookRow]
}

internal extension OrderBookEventModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_OrderBookEvent) {
        self.securityCode = grpcModel.securityCode
        self.securityBoard = grpcModel.securityBoard
        self.asks = grpcModel.asks.map { $0.toModel() }
        self.bids = grpcModel.bids.map { $0.toModel() }
    }
}

internal extension Proto_Tradeapi_V1_OrderBookEvent {
    func toModel() -> OrderBookEventModel {
        return OrderBookEventModel(grpcModel: self)
    }
}
