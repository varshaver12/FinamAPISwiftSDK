public final class CommonStreamWrapper<Stream>: StreamWrapper<CommonApiClient, Stream> {
    
    public static var events: CommonStreamWrapper<EventsStream> {
        .init {
            return $0.eventsStream.stream(handler: $1)
        }
    }
    
}

