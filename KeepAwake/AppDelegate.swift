//
//  AppDelegate.swift
//  KeepAwake
//
//  Created by Sean McElholm on 02/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa
import ServiceManagement

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
	var toggleAwake: Bool!
	let task = Process()
	var toggleString:String = "Enable"
	let menu = NSMenu()
	
	func applicationDidFinishLaunching(_ aNotification: Notification)
	{
		// Insert code here to initialize your application
		if let button = statusItem.button {
			button.image = NSImage(named: NSImage.Name("StatusBarButtonImage"))
			button.action = #selector(ToggleAwakeStatus(_:))
		}
		ConstructMenu()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
		if task.isRunning
		{
			task.terminate()
		}
	}

	@objc func ToggleAwakeStatus(_ sender: Any?)
	{
		if let button = statusItem.button
		{
			if toggleAwake == true
			{
				toggleString = "Enable"
				toggleAwake = false
				task.terminate()
				button.image = NSImage(named: NSImage.Name("StatusBarButtonImage"))
			}
			else
			{
				toggleString = "Disable"
				toggleAwake = true
				task.launchPath = "/usr/bin/caffeinate"
				task.arguments = ["-d"]
				task.launch()
				
				button.image = NSImage(named: NSImage.Name("StatusBarActive"))
			}
			ConstructMenu()
		}
	}
	
	@objc func ToggleLaunchStartup(_ sender: Any?)
	{
		SMLoginItemSetEnabled(Bundle.main.infoDictionary![kCFBundleIdentifierKey as String] as! CFString, true)
	}
	
	func ConstructMenu()
	{
		menu.removeAllItems()
		menu.addItem(NSMenuItem(title: toggleString, action: #selector(AppDelegate.ToggleAwakeStatus(_:)), keyEquivalent: "T"))
		menu.addItem(NSMenuItem.separator())
		menu.addItem(NSMenuItem(title: "Launch at startup", action: #selector(AppDelegate.ToggleLaunchStartup(_:)), keyEquivalent: "P"))
		menu.addItem(NSMenuItem.separator())
		menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
		statusItem.menu = menu
	}
}

