extension String {
    public func countryFlag() -> String {
      let base = 127397
      var tempScalarView = String.UnicodeScalarView()
      for i in self.utf16 {
        if let scalar = UnicodeScalar(base + Int(i)) {
          tempScalarView.append(scalar)
        }
      }
      return String(tempScalarView)
    }
}
