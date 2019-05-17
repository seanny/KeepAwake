//
//  AboutWindow.swift
//  KeepAwake
//
//  Created by Sean McElholm on 17/05/2019.
//  Copyright © 2019 Sean McElholm. All rights reserved.
//

import Foundation
import Cocoa

public class AboutWindow: NSObject
{
    public static let shared = AboutWindow()
    private override init() {
        super.init()
        createAboutWindow()
    }
    var aboutWindow = NSWindow()
    var aboutWindowController = NSWindowController()
    
    func createAboutWindow()
    {
        aboutWindow = NSWindow(contentRect: NSMakeRect(100, 100, 200, 200), styleMask: [.titled, .closable], backing: NSWindow.BackingStoreType.buffered, defer: false)
        aboutWindow.isOpaque = true
        aboutWindow.title = "About KeepAwake"
        aboutWindow.isReleasedWhenClosed = false
        aboutWindowController = NSWindowController(window: aboutWindow)
        
        let label = NSTextField()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 44))
        label.stringValue = "Hello World"
        label.backgroundColor = .white
        label.isBezeled = false
        label.isEditable = false
        label.sizeToFit()
        
        aboutWindowController.window?.contentView?.addSubview(label)
    }
    
    @objc func ShowAbout(_ sender: Any?)
    {
        aboutWindow.makeKeyAndOrderFront(nil)
        aboutWindow.center()
    }
}
