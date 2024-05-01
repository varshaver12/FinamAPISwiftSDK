#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension ApiClient {
    func sendRequest<Result>(_ request: AsyncRequest<Result>) async throws -> Result {
        return try await request.sendAsync(client: self)
    }
}
#endif
