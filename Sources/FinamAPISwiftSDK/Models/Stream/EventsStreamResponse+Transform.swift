internal extension Proto_Tradeapi_V1_Event {
    func transform() -> any StreamData {
        switch self.payload {
        case .order:
            print("OrderEventPayloadModel")
            return OrderEventPayloadModel(response: self)
        case .orderBook:
            print("OrderBookPayloadModel")
            return OrderBookPayloadModel(response: self)
        case .portfolio:
            print("PortfolioEventPayloadModel")
            return PortfolioEventPayloadModel(response: self)
        case .trade:
            print("TradePayloadModel")
            return TradePayloadModel(response: self)
        default:
            print("ResponsePayloadModel")
            return ResponsePayloadModel(response: self)
        }
    }
}
