//
//  AppDelegate.swift
//  KeepAwake
//
//  Created by Sean McElholm on 02/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	let task = Process()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		task.launchPath = "/usr/bin/caffeinate"
		task.arguments = ["-d"]
		task.launch()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
		task.terminate()
	}


}

