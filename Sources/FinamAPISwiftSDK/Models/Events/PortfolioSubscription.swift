/// Portfolio subscription.
/// Подписка на портфель.
public protocol PortfolioSubscription {
  /// Trade Account ID.
  /// Идентификатор торгового счёта.
    var clientID: String { get }
  /// What kind of data the response contains.
  /// Какие данные будут в ответе.
    var content: PortfolioContent { get }
}

internal struct PortfolioSubscriptionModel: PortfolioSubscription {
    var clientID: String
    var content: PortfolioContent
}

internal extension PortfolioSubscriptionModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_PortfolioSubscription) {
        self.clientID = grpcModel.clientID
        self.content = grpcModel.content.toModel()
    }
}

internal extension Proto_Tradeapi_V1_PortfolioSubscription {
    func toModel() -> PortfolioSubscriptionModel {
        PortfolioSubscriptionModel(grpcModel: self)
    }
}
