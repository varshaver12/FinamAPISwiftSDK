internal extension RawRepresentable {
    /// Создаёт объект по его чистому значению.
    ///
    /// - Parameter rawValue: Чистое значение.
    ///
    /// - Throws: `FinamApiError.valueOutOfRange`
    ///
    /// - Returns: Созданный объект.
    static func new(rawValue: RawValue) throws -> Self {
        guard let value = Self(rawValue: rawValue) else {
            throw FinamApiError.valueOutOfRange
        }
        return value
    }
}
