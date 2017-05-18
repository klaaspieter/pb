import AppKit
import Foundation

let stdin = FileHandle.standardInput
let data = stdin.readDataToEndOfFile()
let pasteboard = NSPasteboard.general()
pasteboard.clearContents()
pasteboard.setData(data, forType: kUTTypeData as String)
