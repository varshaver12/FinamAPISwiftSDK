/// TakeProfit order.
/// Тейк профит заявка.
public protocol TakeProfit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Activation price.
  /// Цена активации.
  var activationPrice: Double { get }

  /// Correction.
  /// Коррекция.
    var correctionPrice: StopPrice { get }

  /// Spread price.
  /// Защитный спрэд.
    var spreadPrice: StopPrice { get }

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

internal struct TakeProfitModel: TakeProfit {
    var activationPrice: Double
    var correctionPrice: StopPrice
    var spreadPrice: StopPrice
    var marketPrice: Bool
    var quantity: StopQuantity
    var time: Int32
    var useCredit: Bool
}

internal extension TakeProfitModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_TakeProfit) throws {
        self.activationPrice = grpcModel.activationPrice
        self.correctionPrice = try grpcModel.correctionPrice.toModel()
        self.spreadPrice = try grpcModel.spreadPrice.toModel()
        self.marketPrice = grpcModel.marketPrice
        self.quantity = try grpcModel.quantity.toModel()
        self.time = grpcModel.time
        self.useCredit = grpcModel.useCredit
    }
}

internal extension Proto_Tradeapi_V1_TakeProfit {
    func toModel() throws -> TakeProfitModel {
        try TakeProfitModel(grpcModel: self)
    }
}
