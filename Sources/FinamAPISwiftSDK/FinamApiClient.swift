public final class FinamApiClient {
    public struct Constants {
        public static let port = 443
        public static let host = "trade-api.finam.ru"
    }

    public static func common(
        _ token: String,
        host: String = Constants.host,
        port: Int = Constants.port
    ) throws -> CommonApiClient {
        guard !token.isEmpty, !host.isEmpty, port != 0 else {
            throw FinamApiError.invalidInitializationData
        }
        return try CommonFinamApiClient(
            .common(host, port: port),
            token: token
        )
    }
}
