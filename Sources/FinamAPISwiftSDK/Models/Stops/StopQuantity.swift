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
public struct StopQuantity: Codable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value.
  /// Значение объема.
    var value: Double

  /// Units.
  /// Единицы объема.
    var units: StopQuantityUnits
    
    public init(value: Double, units: StopQuantityUnits) {
        self.value = value
        self.units = units
    }

}

internal extension StopQuantity {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_StopQuantity) throws {
        self.value = grpcModel.value
        self.units = try .new(rawValue: grpcModel.units.rawValue)
    }
    
    func forRequest() throws -> Proto_Tradeapi_V1_StopQuantity {
        var grpcModel = Proto_Tradeapi_V1_StopQuantity()
        grpcModel.value = value
        grpcModel.units = try .new(rawValue: units.rawValue)

        return grpcModel
    }
}

internal extension Proto_Tradeapi_V1_StopQuantity {
    func toModel() throws -> StopQuantity {
        try StopQuantity(grpcModel: self)
    }
}
