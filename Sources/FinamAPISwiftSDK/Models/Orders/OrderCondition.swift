import Foundation

/// Условие заявки.
public enum OrderConditionType: Int, Codable {
    
    /// Value is not specified. Do not use.
    /// Значение не указано. Не использовать.
    case unspecified // = 0

    /// Best Bid.
    /// Лучшая цена покупки.
    case bid // = 1

    /// Best Bid or Last trade price and higher.
    /// Лучшая цена покупки или сделка по заданной цене и выше.
    case bidOrLast // = 2

    /// Best Ask.
    /// Лучшая цена продажи.
    case ask // = 3

    /// Best Ask or Last trade price and lower.
    /// Лучшая цена продажи или сделка по заданной цене и ниже.
    case askOrLast // = 4

    /// Placement time. Parameter OrderCondition.time must be set.
    /// Время выставления заявки на Биржу. Параметр OrderCondition.time должен быть установлен.
    case time // = 5

    /// Coverage below specified.
    /// Обеспеченность ниже заданной.
    case covDown // = 6

    /// Coverage above specified.
    /// Обеспеченность выше заданной.
    case covUp // = 7

    /// Last trade price and higher.
    /// Сделка на рынке по заданной цене или выше.
    case lastUp // = 8

    /// Last trade price and lower.
    /// Сделка на рынке по заданной цене или ниже.
    case lastDown // = 9

}

public protocol OrderCondition {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Condition type.
  /// Тип условия.
    var type: OrderConditionType { get }

  /// Conditional value.
  /// Значение для условия.
    var price: Double { get }

  /// Placement time.
  /// Время выставления.
    var time: Date { get }
 
}

internal struct OrderConditionModel: OrderCondition {
    var type: OrderConditionType
    
    var price: Double
    
    var time: Date
    
    
}

internal extension OrderConditionModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_OrderCondition) throws {
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.price = grpcModel.price
        self.time = grpcModel.time.date
    }
}

internal extension Proto_Tradeapi_V1_OrderCondition {
    func toModel() throws -> OrderConditionModel {
        try OrderConditionModel(grpcModel: self)
    }
}
