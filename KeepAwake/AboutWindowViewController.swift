//
//  AboutWindowViewController.swift
//  KeepAwake
//
//  Created by Sean McElholm on 15/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Cocoa

class AboutWindowViewController: NSViewController
{

	@IBOutlet var aboutView: NSView!
	@IBOutlet weak var appIcon: NSImageView!
	@IBOutlet var licenseText: NSTextView!
	
	var licText = NSTextStorage()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		aboutView.window?.center()
		licenseText.isEditable = false
	}
}
