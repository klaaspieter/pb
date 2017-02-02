import AppKit
import Foundation

if let image = NSImage(pasteboard: .general()),
    let data = image.tiffRepresentation {
  let stdout = FileHandle.standardOutput
  stdout.write(data)
} else {
  let process = Process()
  process.launchPath = "/usr/bin/pbpaste"
  process.launch()
  process.waitUntilExit()
  exit(process.terminationStatus)
}
