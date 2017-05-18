import AppKit
import Foundation

let pasteboard = NSPasteboard.general()
if let data = pasteboard.data(forType: kUTTypeData as String) {
  let stdout = FileHandle.standardOutput
  stdout.write(data)
} else {
  let process = Process()
  process.launchPath = "/usr/bin/pbpaste"
  process.launch()
  process.waitUntilExit()
  exit(process.terminationStatus)
}
