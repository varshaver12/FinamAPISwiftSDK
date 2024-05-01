/// What kind of data the response contains.
/// Какие данные будут в ответе.
public struct PortfolioContent {

  /// Currency positions.
  /// Валютные позиции.
  var includeCurrencies: Bool

  /// Money positions.
  /// Денежные позиции.
  var includeMoney: Bool

  /// DEPO positions.
  /// Позиции DEPO.
  var includePositions: Bool

  /// Buy and Sell limits.
  /// Лимиты покупки и продажи.
  var includeMaxBuySell: Bool

    public init(includeCurrencies: Bool, includeMoney: Bool, includePositions: Bool, includeMaxBuySell: Bool) {
        self.includeCurrencies = includeCurrencies
        self.includeMoney = includeMoney
        self.includePositions = includePositions
        self.includeMaxBuySell = includeMaxBuySell
    }
}

internal extension PortfolioContent {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_PortfolioContent) {
        self.includeCurrencies = grpcModel.includeCurrencies
        self.includeMoney = grpcModel.includeMoney
        self.includePositions = grpcModel.includePositions
        self.includeMaxBuySell = grpcModel.includeMaxBuySell
    }
    
    func forRequest() -> Proto_Tradeapi_V1_PortfolioContent {
        var grpcModel = Proto_Tradeapi_V1_PortfolioContent()
        grpcModel.includeCurrencies = includeCurrencies
        grpcModel.includeMoney = includeMoney
        grpcModel.includePositions = includePositions
        grpcModel.includeMaxBuySell = includeMaxBuySell
        
        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_PortfolioContent {
    func toModel() -> PortfolioContent {
        PortfolioContent(grpcModel: self)
    }
}
