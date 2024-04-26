import Foundation
//
///// TakeProfit order.
///// Тейк профит заявка.
//public protocol TakeProfit {
//  // SwiftProtobuf.Message conformance is added in an extension below. See the
//  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
//  // methods supported on all messages.
//
//  /// Activation price.
//  /// Цена активации.
//  var activationPrice: Double { get }
//
//  /// Correction.
//  /// Коррекция.
//    var correctionPrice: StopPrice { get }
//
//  /// Spread price.
//  /// Защитный спрэд.
//    var spreadPrice: StopPrice { get }
//
//  /// Market price.
//  /// По рынку.
//    var marketPrice: Bool { get }
//
//  /// Quantity.
//  /// Количество.
//    var quantity: StopQuantity { get }
//
//  /// Time, seconds.
//  /// Защитное время, сек.
//    var time: Int32 { get }
//
//  /// Use credit.
//  /// Использовать кредит.
//    var useCredit: Bool { get }
//
//}
/// TakeProfit order.
/// Тейк профит заявка.
public struct TakeProfit: Codable {
    /// Activation price.
    /// Цена активации.
    var activationPrice: Double
    /// Correction.
    /// Коррекция.
    var correctionPrice: StopPrice?
    /// Spread price.
    /// Защитный спрэд.
    var spreadPrice: StopPrice?
    /// Market price.
    /// По рынку.
    var marketPrice: Bool
    /// Quantity.
    /// Количество.
    var quantity: StopQuantity?
    /// Time, seconds.
    /// Защитное время, сек.
    var time: Int32
    /// Use credit.
    /// Использовать кредит.
    var useCredit: Bool
    
    public init(activationPrice: Double, correctionPrice: StopPrice?, spreadPrice: StopPrice?, marketPrice: Bool, quantity: StopQuantity?, time: Int32, useCredit: Bool) {
        self.activationPrice = activationPrice
        self.correctionPrice = correctionPrice
        self.spreadPrice = spreadPrice
        self.marketPrice = marketPrice
        self.quantity = quantity
        self.time = time
        self.useCredit = useCredit
    }
}

internal extension TakeProfit {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_TakeProfit) throws {
        self.activationPrice = grpcModel.activationPrice
        self.correctionPrice = try grpcModel.correctionPrice.toModel()
        self.spreadPrice = try grpcModel.spreadPrice.toModel()
        self.marketPrice = grpcModel.marketPrice
        self.quantity = try grpcModel.quantity.toModel()
        self.time = grpcModel.time
        self.useCredit = grpcModel.useCredit
    }
    
    func forRequest() throws -> Proto_Tradeapi_V1_TakeProfit {
        print("TakeProfit forRequest() go")
        var grpcModel = Proto_Tradeapi_V1_TakeProfit()
        grpcModel.activationPrice = activationPrice
        if let price = correctionPrice { grpcModel.correctionPrice = try price.forRequest() }
        if let price = spreadPrice { grpcModel.spreadPrice = try price.forRequest() }
        grpcModel.marketPrice = marketPrice
        if let quantity = quantity { grpcModel.quantity = try quantity.forRequest() }
        grpcModel.time = time
        grpcModel.useCredit = useCredit
        print("TakeProfit forRequest() done")
        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_TakeProfit {
    func toModel() throws -> TakeProfit {
        try TakeProfit(grpcModel: self)
    }
}
