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
    
    let startScript = "~/start.sh"

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "spring")
        icon?.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func menuClicked(sender: NSMenuItem) {
        let startURL = NSBundle.mainBundle().URLForResource("startup", withExtension: "scpt")
        let closeURL = NSBundle.mainBundle().URLForResource("close", withExtension: "scpt")
        var script = NSAppleScript()
        var errors : NSDictionary? = [:]
        
        if sender.state == NSOnState {
            sender.state = NSOffState
            script = NSAppleScript(contentsOfURL: closeURL!, error: &errors)!
        } else {
            sender.state = NSOnState
            script = NSAppleScript(contentsOfURL: startURL!, error: &errors)!
        }
        
        script.executeAndReturnError(&errors)
        print(errors)        
    }

}

