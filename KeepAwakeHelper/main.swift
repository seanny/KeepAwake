//
//  main.swift
//  KeepAwakeHelper
//
//  Created by Sean McElholm on 02/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa
import ServiceManagement

let fileName = "LaunchOnStartup"
let text:String!
let bundleID:CFString = "com.seanmcelholm.KeepAwake" as CFString
let developer = "Sean McElholm"

let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0] as String
let url = NSURL(fileURLWithPath: path)

var fullDirectory = path + "/" + developer + "/" + (bundleID as String) + "/"
var fullPath = fullDirectory + fileName
print("Path: " + path)
print("BundleID: " + (bundleID as String))
print("Filename: " + fileName)
print("Developer: " + developer)
print("FullDirectory: " + fullDirectory)
print("Fullpath: " + fullPath)

/*if let pathComponent = url.appendingPathComponent(fileName)
{*/
	let file = url.appendingPathComponent((bundleID as String))
	if FileManager.default.fileExists(atPath: (file?.path)! + "/" + fileName + ".txt")
	{
		if FileManager.default.isDeletableFile(atPath: (file?.path)!)
		{
			print("Not launching on startup")
			try FileManager.default.removeItem(at: (file)!)
			SMLoginItemSetEnabled(bundleID, false)
			let alert:NSAlert = NSAlert()
			alert.messageText = "Launch on Startup"
			alert.informativeText = "Keep Awake will no longer start on launch."
			alert.alertStyle = NSAlert.Style.informational
			alert.addButton(withTitle: "OK")
			alert.runModal()
		}
		else
		{
			print("Cannot delete file")
		}
	}
	else
	{
		// TODO: Create empty file with name "LaunchOnStartup.txt"
		let text:String = ""
		print("Creating directory: " + (file?.path)!)
		try FileManager.default.createDirectory(atPath: file!.path, withIntermediateDirectories: true)
		file!.appendingPathComponent(fileName)
		file!.appendingPathComponent(".txt")
		let filePath = file!
		try FileManager.default.createFile(atPath: file!.path, contents: text.data(using: String.Encoding.utf8))
		//try text.write(to:filePath, atomically: false, encoding: String.Encoding.utf8)
		
		print("Launching on startup: " + (file?.path)!)
		SMLoginItemSetEnabled(bundleID, true)
	}
//}

print("Hello world ")
