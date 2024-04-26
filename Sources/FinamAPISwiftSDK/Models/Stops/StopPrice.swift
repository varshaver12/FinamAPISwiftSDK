/// Stop price units.
/// Единицы цены стоп-заявки.
public enum StopPriceUnits: Int, Codable {
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0
    
    /// Percent.
    /// Значение а процентах.
    case percent // = 1
    
    /// Lots.
    /// Значение в единицах цены.
    case pips // = 2
    
}

/// Stop price.
/// Цена стоп-заявки.
//public protocol StopPrice {
//    // SwiftProtobuf.Message conformance is added in an extension below. See the
//    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
//    // methods supported on all messages.
//    
//    /// Value.
//    /// Значение цены.
//    var value: Double { get }
//    
//    /// Units.
//    /// Единицы цены.
//    var units: StopPriceUnits { get }
//    
//}
/// Stop price.
/// Цена стоп-заявки.
public struct StopPrice: Codable {
    /// Value.
    /// Значение цены.
    var value: Double
    /// Units.
    /// Единицы цены.
    var units: StopPriceUnits
    
    public init(value: Double, units: StopPriceUnits) {
        self.value = value
        self.units = units
    }
}

internal extension StopPrice {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_StopPrice) throws {
        self.value = grpcModel.value
        self.units = try .new(rawValue: grpcModel.units.rawValue)
    }
    
    func forRequest() throws -> Proto_Tradeapi_V1_StopPrice {
        var grpcModel = Proto_Tradeapi_V1_StopPrice()
        grpcModel.value = value
        grpcModel.units = try .new(rawValue: units.rawValue)
        
        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_StopPrice {
    func toModel() throws -> StopPrice {
        try StopPrice(grpcModel: self)
    }
}
