internal extension Proto_Tradeapi_V1_Event {
    func transform() -> any StreamData {
        switch self.payload {
        case .order:
            return OrderEventPayloadModel(response: self)
        case .orderBook:
            return OrderBookPayloadModel(response: self)
        case .portfolio:
            return PortfolioEventPayloadModel(response: self)
        case .trade:
            return TradePayloadModel(response: self)
        default:
            return ResponsePayloadModel(response: self)
        }
    }
}
