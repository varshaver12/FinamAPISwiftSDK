import Foundation
import SwiftProtobuf

extension Double {
    func toGoogleProtobufDoubleValue() -> Google_Protobuf_DoubleValue {
        var googleDoubleValue = Google_Protobuf_DoubleValue()
        googleDoubleValue.value = self
        return googleDoubleValue
    }
}
