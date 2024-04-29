import GRPC

public struct EventsStream {
    private let call: BidirectionalStreamingCall
        <Proto_Tradeapi_V1_SubscriptionRequest,
         Proto_Tradeapi_V1_Event>
    
    internal init(_ call: BidirectionalStreamingCall
                  <Proto_Tradeapi_V1_SubscriptionRequest,
                  Proto_Tradeapi_V1_Event>)
    {
        self.call = call
    }
    
    public func send(_ request: EventsStreamRequest) -> Void {
        let requests = request.transformToRequestsForCall()
        _ = call.sendMessages(requests)
    }
    
    /// Разрывает соединение с сервером.
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
