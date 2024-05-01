public final class CommonStreamWrapper<Stream>: StreamWrapper<ApiClient, Stream> {
    
    public static var events: CommonStreamWrapper<EventsStream> {
        .init {
            return $0.eventsStream.stream(handler: $1)
        }
    }
    
}

