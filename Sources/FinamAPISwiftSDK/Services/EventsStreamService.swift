/// Сервис получения биржевой информации в реальном времени.
public protocol EventsStreamService {

    func stream(handler: @escaping (any StreamData) -> Void) -> EventsStream
    
}

internal struct GrpcEventsStreamService: EventsStreamService {
    let client: EventsStreamServiceClient
    
    init(_ client: EventsStreamServiceClient) {
        self.client = client
    }
    
    func stream(handler: @escaping (any StreamData) -> Void) -> EventsStream {
        let call = self.client.getEvents { response in
            handler(response.transform())
        }
        return EventsStream(call)
    }

}
