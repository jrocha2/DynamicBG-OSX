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

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    let startURL = NSBundle.mainBundle().URLForResource("startup", withExtension: "scpt")
    let closeURL = NSBundle.mainBundle().URLForResource("close", withExtension: "scpt")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "spring")
        icon?.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: #selector(applicationWillWake), name: NSWorkspaceDidWakeNotification, object: nil)
    }
    
    func applicationWillWake(aNotification: NSNotification) {
        if statusMenu.itemArray[0].state == NSOnState {
            setDynamicBGEnabled(true)
        }
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
    
    @IBAction func chooseBackground(sender: NSMenuItem) {
        let fileWindow = NSOpenPanel()
        fileWindow.allowsMultipleSelection = false
        fileWindow.canChooseDirectories = false
        fileWindow.canCreateDirectories = false
        fileWindow.canChooseFiles = true
        let selection = fileWindow.runModal()
        if selection == NSModalResponseOK {
            print(fileWindow.URL)
        }
        
    }
    
    @IBAction func quitApplication(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
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

