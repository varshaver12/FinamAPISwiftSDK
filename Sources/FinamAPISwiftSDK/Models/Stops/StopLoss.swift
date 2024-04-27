import Foundation
/// StopLoss order.
/// Стоп лосс заявка.
public struct StopLoss: Codable {
    /// Activation price.
    /// Цена активации.
    var activationPrice: Double
    /// Price.
    /// Цена заявки.
    var price: Double
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
    
    public init(activationPrice: Double, price: Double, marketPrice: Bool, quantity: StopQuantity?, time: Int32, useCredit: Bool) {
        self.activationPrice = activationPrice
        self.price = price
        self.marketPrice = marketPrice
        self.quantity = quantity
        self.time = time
        self.useCredit = useCredit
    }
}

internal extension StopLoss {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_StopLoss) throws {
        self.activationPrice = grpcModel.activationPrice
        self.price = grpcModel.price
        self.marketPrice = grpcModel.marketPrice
        self.quantity = try grpcModel.quantity.toModel()
        self.time = grpcModel.time
        self.useCredit = grpcModel.useCredit
    }
    
    func forRequest() throws -> Proto_Tradeapi_V1_StopLoss {
        var grpcModel = Proto_Tradeapi_V1_StopLoss()
        grpcModel.activationPrice = activationPrice
        grpcModel.price = price
        grpcModel.marketPrice = marketPrice
        if let quantity = quantity { grpcModel.quantity = try quantity.forRequest() }
        grpcModel.time = time
        grpcModel.useCredit = useCredit
        
        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_StopLoss {
    func toModel() throws -> StopLoss {
        try StopLoss(grpcModel: self)
    }
}
