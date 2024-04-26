/// StopLoss order.
/// Стоп лосс заявка.
public protocol StopLoss {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Activation price.
  /// Цена активации.
  var activationPrice: Double { get }

  /// Price.
  /// Цена заявки.
    var price: Double { get }

  /// Market price.
  /// По рынку.
    var marketPrice: Bool { get }

  /// Quantity.
  /// Количество.
    var quantity: StopQuantity { get }

  /// Time, seconds.
  /// Защитное время, сек.
    var time: Int32 { get }

  /// Use credit.
  /// Использовать кредит.
    var useCredit: Bool { get }

}

internal struct StopLossModel: StopLoss {
    var activationPrice: Double
    var price: Double
    var marketPrice: Bool
    var quantity: StopQuantity
    var time: Int32
    var useCredit: Bool
}

internal extension StopLossModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_StopLoss) throws {
        self.activationPrice = grpcModel.activationPrice
        self.price = grpcModel.price
        self.marketPrice = grpcModel.marketPrice
        self.quantity = try grpcModel.quantity.toModel()
        self.time = grpcModel.time
        self.useCredit = grpcModel.useCredit
    }
}

internal extension Proto_Tradeapi_V1_StopLoss {
    func toModel() throws -> StopLossModel {
        try StopLossModel(grpcModel: self)
    }
}
