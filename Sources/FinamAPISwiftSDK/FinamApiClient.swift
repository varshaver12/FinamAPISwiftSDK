public final class FinamApiClient {
    public struct Constants {
        public static let port = 443
        public static let host = "trade-api.finam.ru"
        public static let appName = "varshaver.finam-api-swift-sdk"
    }

    /// Создаёт экземпляр `CommonApiClient` для взаимодействия с Finam API.
    ///
    ///  - Parameters:
    ///      - token: Токен доступа клиента к Finam API.
    ///      - appName: Наименование приложения. По умолчанию: varshaver.finam-api-swift-sdk
    ///      - host: Адрес назначения Finam API. По умолчанию: trade-api.finam.ru
    ///      - port: Порт назначения Finam API. По умолчанию: 443
    ///
    ///  - Returns: Экземпляр клиента `CommonApiClient`.
    public static func common(
        _ token: String,
        appName: String = Constants.appName,
        host: String = Constants.host,
        port: Int = Constants.port
    ) throws -> CommonApiClient {
        guard !token.isEmpty, !host.isEmpty, port != 0 else {
            throw FinamApiError.invalidInitializationData
        }
        return try CommonFinamApiClient(
            .common(host, port: port),
            token: token,
            appName: appName.isEmpty ? Constants.appName : appName
        )
    }
}
