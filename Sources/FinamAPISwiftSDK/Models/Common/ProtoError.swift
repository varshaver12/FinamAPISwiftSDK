/// Error data.
/// Данные об ошибке.
public protocol ProtoError {
    /// Error code.
    /// Код ошибки.
    var code: String { get }
    /// Error message.
    /// Сообщение об ошибке.
    var message: String { get }
    
}

internal struct ProtoErrorModel: ProtoError {
    var code: String
    var message: String
}

internal extension ProtoErrorModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_Error) {
        self.code = grpcModel.code
        self.message = grpcModel.message
    }
}

internal extension Proto_Tradeapi_V1_Error {
    func toModel() -> ProtoErrorModel {
        ProtoErrorModel(grpcModel: self)
    }
}
