/// Stop quantity units.
/// Единицы объема стоп-заявки.
public enum StopQuantityUnits: Int, Codable  {

  /// Value is not specified. Do not use.
  /// Значение не указано. Не использовать.
  case unspecified // = 0

  /// Percent.
  /// Значение а процентах.
  case percent // = 1

  /// Lots.
  /// Значение в лотах.
  case lots // = 2

}

/// Stop quantity.
/// Объем стоп-заявки.
public protocol StopQuantity {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value.
  /// Значение объема.
    var value: Double { get }

  /// Units.
  /// Единицы объема.
    var units: StopQuantityUnits { get }

}


internal struct StopQuantityModel: StopQuantity {
    var value: Double
    var units: StopQuantityUnits
}

internal extension StopQuantityModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_StopQuantity) throws {
        self.value = grpcModel.value
        self.units = try .new(rawValue: grpcModel.units.rawValue)
    }
}

internal extension Proto_Tradeapi_V1_StopQuantity {
    func toModel() throws -> StopQuantityModel {
        try StopQuantityModel(grpcModel: self)
    }
}
