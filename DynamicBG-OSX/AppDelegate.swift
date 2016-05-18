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
    let prefURL = NSBundle.mainBundle().URLForResource("pref", withExtension: "scpt")
    
    let defaults = NSUserDefaults()
    var dontShowInfo = false

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "spring")
        icon?.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        let shouldStartRunning = defaults.objectForKey("shouldStartRunning") as? Bool ?? false
        dontShowInfo = defaults.objectForKey("dontShowInfo") as? Bool ?? false
        if shouldStartRunning {
            setDynamicBGEnabled(true)
            statusMenu.itemArray[0].state = NSOnState
        }
        
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: #selector(applicationWillWake), name: NSWorkspaceDidWakeNotification, object: nil)
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: #selector(applicationWillPowerOff), name: NSWorkspaceWillPowerOffNotification, object: nil)
    }
    
    func applicationWillWake(aNotification: NSNotification) {
        if statusMenu.itemArray[0].state == NSOnState {
            setDynamicBGEnabled(true)
        }
    }
    
    func applicationWillPowerOff(aNotification: NSNotification) {
        if statusMenu.itemArray[0].state == NSOnState {
            defaults.setObject(true, forKey: "shouldStartRunning")
        } else {
            defaults.setObject(false, forKey: "shouldStartRunning")
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
            if let filePath = fileWindow.URL?.path {
                if fileWindow.URL?.pathExtension == "saver" || fileWindow.URL?.pathExtension == "qtz" {
                    addBackground(filePath)
                } else {
                    let alert = NSAlert()
                    alert.messageText = "Error Selecting a File"
                    alert.informativeText = "This error is most likely because the file you choose did not have a file extension of .qtz or .saver"
                    alert.runModal()
                }
            }
            
        }
    }
    
    func addBackground(path: String) {
        // Copy file to correct folder
        let text = "set s to \"\(path)\"\n" +
                    "set d to \"/Library/Screen Savers\"\n" +
                    "do shell script \"cp -r \" & quoted form of s & \" \" & quoted form of d with administrator privileges"
        let script = NSAppleScript(source: text)
        var errors : NSDictionary? = [:]
        
        script!.executeAndReturnError(&errors)
        print(errors)
        
        
        if statusMenu.itemArray[0].state == NSOnState {
            setDynamicBGEnabled(false)
            setDynamicBGEnabled(true)
        }
    }
    
    // Open System Preferences to allow choice
    @IBAction func selectBackground(sender: NSMenuItem) {
        
        if !dontShowInfo {
            let alert = NSAlert()
            alert.alertStyle = .InformationalAlertStyle
            alert.showsSuppressionButton = true
            alert.messageText = "Select Background"
            alert.informativeText = "In order to simulate a dynamic background, please set it as your screen saver in the next screen even if you choose the option to start \"Never\""
            alert.runModal()
            
            if alert.suppressionButton?.state == 0 {
                dontShowInfo = false
            } else {
                dontShowInfo = true
                defaults.setObject(true, forKey: "dontShowInfo")
            }
        }
        
        var errors : NSDictionary? = [:]
        let script = NSAppleScript(contentsOfURL: prefURL!, error: &errors)!
        script.executeAndReturnError(&errors)
        print(errors)
        
        statusMenu.itemArray[0].state = NSOffState
        setDynamicBGEnabled(false)
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

