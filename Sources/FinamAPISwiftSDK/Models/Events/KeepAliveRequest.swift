/// Keep-alive request.
/// Keep-alive запрос.
public protocol KeepAliveRequest {
    /// Request ID.
    /// Идентификатор запроса.
    var requestID: String { get }
    
}

internal struct KeepAliveRequestModel: KeepAliveRequest {
    var requestID: String
}

internal extension KeepAliveRequestModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_KeepAliveRequest) {
        self.requestID = grpcModel.requestID
    }
}

internal extension Proto_Tradeapi_V1_KeepAliveRequest {
    func toModel() -> KeepAliveRequestModel {
        KeepAliveRequestModel(grpcModel: self)
    }
}
