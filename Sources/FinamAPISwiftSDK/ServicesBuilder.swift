import GRPC
import NIOHPACK

internal class ServicesBuilder {
    private let channel: GRPCChannel
    private let callOptions: CallOptions
    
    init(_ channel: GRPCChannel, token: String) {
        self.channel = channel
        let headers = HPACKHeaders([("Authorization", "Bearer \(token)")])
        self.callOptions = CallOptions(customMetadata: headers)
    }
    
}
