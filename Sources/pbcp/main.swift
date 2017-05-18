import AppKit
import Foundation

extension MimeType {
  var pasteboardType: String? {
    switch self {
      case .png: return NSPasteboardTypePNG
      case .gif: return kUTTypeGIF as String
      case .octetStream: return .none
    }
  }
}

let stdin = FileHandle.standardInput
let stdout = FileHandle.standardOutput

let data = stdin.readDataToEndOfFile()
if let pasteboardType = MimeType(data: data).pasteboardType {
  let pasteboard = NSPasteboard.general()
  pasteboard.clearContents()
  let result = pasteboard.setData(data, forType: pasteboardType)
} else {
  let process = Process()
  process.launchPath = "/usr/bin/pbcopy"
  let pipe = Pipe()
  process.standardInput = pipe
  process.launch()
  let output = pipe.fileHandleForWriting
  output.write(data)
  output.closeFile()
  process.waitUntilExit()
  exit(process.terminationStatus)
}
