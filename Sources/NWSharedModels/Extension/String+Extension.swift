
extension String {
    public var countryFlag: String {
        let base: UInt32 = 127397
        var s = ""
        for v in self.uppercased().unicodeScalars {
          if let scalar = UnicodeScalar(base + v.value) {
              s.unicodeScalars.append(scalar)
          }
        }
        return String(s)
    }
}
