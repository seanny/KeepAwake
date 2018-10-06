//
//  HelperApp.swift
//  KeepAwake
//
//  Created by Sean McElholm on 06/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa

final class HelperApp
{
	var startAtLogin = Bool()
	let helperBundleName = "com.seanmcelholm.KeepAwakeHelper"
	
	func GetHelper() -> Bool
	{
		let apps = NSWorkspace.shared.runningApplications
		for app in apps
		{
			if app.bundleIdentifier == helperBundleName
			{
				return true
			}
		}
		return false
	}
	
	func StartHelper() -> Bool
	{
		//let helperTask:Process
		let path = Bundle.main.bundleURL.path + "/Resources/KeepAwakeHelper"
		print(path.description)
		return true
	}
}
