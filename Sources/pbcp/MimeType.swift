import Foundation

enum MimeType {
  case png
  case gif
  case octetStream
}

extension MimeType {
  init(data: Data) {
    switch data.first {
      case 0x89?:
        self = .png
      case 0x47?:
        self = .gif
      default:
        self = .octetStream
    }
  }
}
