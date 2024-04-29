/// Request execution result.
/// Результат выполнения запроса.
public protocol ResponseEvent {
  /// Request ID.
  /// Идентификатор запроса.
    var requestID: String { get }
  /// Request execution result.
  /// Результат выполнения запроса.
    var success: Bool { get }
  /// Errors in request execution.
  /// Ошибки выполнения запроса.
    var errors: [ProtoError] { get }

}

internal struct ResponseEventModel: ResponseEvent {
    var requestID: String
    var success: Bool
    var errors: [ProtoError]
}

internal extension ResponseEventModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_ResponseEvent) {
        self.requestID = grpcModel.requestID
        self.success = grpcModel.success
        self.errors = grpcModel.errors.map { $0.toModel() }
    }
}

internal extension Proto_Tradeapi_V1_ResponseEvent {
    func toModel() -> ResponseEventModel {
        ResponseEventModel(grpcModel: self)
    }
}
