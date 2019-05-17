//
//  AppDelegate.swift
//  KeepAwake
//
//  Created by Sean McElholm on 02/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa
import CoreGraphics
import ServiceManagement

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
	var toggleAwake: Bool!
	let task = Process()
	var toggleString:String = "Enable"
	let menu = NSMenu()
	var caffeine = Caffeine()
	var helperFound = Bool()
	var launchButton = NSMenuItem()
	
	func applicationDidFinishLaunching(_ aNotification: Notification)
	{
		// Insert code here to initialize your application
		if let button = statusItem.button {
			button.image = NSImage(named: NSImage.Name("StatusBarButtonImage"))
			button.action = #selector(ToggleAwakeStatus(_:))
			button.image?.isTemplate = true
		}
        
        NSApp.activate(ignoringOtherApps: true)
        AboutWindow.shared.createAboutWindow()
		ConstructMenu()
	}

	func applicationWillTerminate(_ aNotification: Notification)
	{
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
            #if DEBUG
			print("isRunning: " + caffeine.isRunning.description)
            #endif
			if caffeine.isRunning == true
			{
				toggleString = "Enable"
				caffeine.stopCaffeinate()
				
				button.image = NSImage(named: NSImage.Name("StatusBarButtonImage"))
				button.image?.isTemplate = true
			}
			else
			{
				toggleString = "Disable"
				caffeine.launchCaffeinate()
				
				button.image = NSImage(named: NSImage.Name("StatusBarActive"))
				button.image?.isTemplate = true
			}
			ConstructMenu()
		}
    }
	
	func ConstructMenu()
	{
        let aboutItem = NSMenuItem(title: "About KeepAwake", action: #selector(AboutWindow.ShowAbout(_:)), keyEquivalent: "")
        aboutItem.isEnabled = true
        aboutItem.target = AboutWindow.shared
        
		menu.removeAllItems()
		menu.addItem(NSMenuItem(title: toggleString, action: #selector(AppDelegate.ToggleAwakeStatus(_:)), keyEquivalent: ""))
		menu.addItem(NSMenuItem.separator())
		menu.addItem(aboutItem)
		menu.addItem(NSMenuItem.separator())
		menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: ""))
		statusItem.menu = menu
	}
}

