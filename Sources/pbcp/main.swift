import AppKit
import Foundation

let stdin = FileHandle.standardInput
let stdout = FileHandle.standardOutput

let data = stdin.availableData
if let image = NSImage(data: data) {
  let pasteboard = NSPasteboard.general()
  pasteboard.clearContents()
  pasteboard.writeObjects([image])
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
