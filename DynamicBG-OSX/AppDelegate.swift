//
//  AppDelegate.swift
//  DynamicBG-OSX
//
//  Created by John Rocha on 5/15/16.
//  Copyright © 2016 John Rocha. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    let startURL = NSBundle.mainBundle().URLForResource("startup", withExtension: "scpt")
    let closeURL = NSBundle.mainBundle().URLForResource("close", withExtension: "scpt")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "spring")
        icon?.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        setDynamicBGEnabled(false)
    }

    @IBAction func menuClicked(sender: NSMenuItem) {
        if sender.state == NSOnState {
            sender.state = NSOffState
            setDynamicBGEnabled(false)
        } else {
            sender.state = NSOnState
            setDynamicBGEnabled(true)
        }
    }
    
    func setDynamicBGEnabled(bool: Bool) {
        var script = NSAppleScript()
        var errors : NSDictionary? = [:]

        if bool {
            script = NSAppleScript(contentsOfURL: startURL!, error: &errors)!
        } else {
            script = NSAppleScript(contentsOfURL: closeURL!, error: &errors)!
        }
        
        script.executeAndReturnError(&errors)
        print(errors)
    }
    
}

