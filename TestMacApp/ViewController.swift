//
//  ViewController.swift
//  TestMacApp
//
//  Created by Bharat Byan on 12/05/17.
//  Copyright © 2017 Bharat Byan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("git configured.")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func actBtn1(_ sender: Any) {
//        stopNSURL()
//        killTwo()
//        killThree()
        killInternetSuckers1()
    }

    @IBAction func actBtnTwo(_ sender: Any) {
        killInternetSuckers2()
    }
    
    func killInternetSuckers1(){
//        NSAppleScript(source: "do shell script \"sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
        NSAppleScript(source: "do shell script \"sudo launchctl unload /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist\" with administrator " +
            "privileges")!.executeAndReturnError(nil)
    }
    
    func killInternetSuckers2(){
//        NSAppleScript(source: "do shell script \"launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist launchctl unload /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
        NSAppleScript(source: "do shell script \"launchctl unload /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist\"")!.executeAndReturnError(nil)
    }
    
    func stopNSURL(){
        let task = Process()
//        task.launchPath = "/usr/sbin/sysctl"
//        task.arguments = ["-w", "net.inet.tcp.delayed_ack=0"]
        
//        launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
//        launchctl unload /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist
//        sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist
//        sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
        
        task.launchPath = "/usr/"
        task.arguments = ["-a", "TextEdit"]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        print("OUTPUT: \(output)")
    }
    
    func killTwo(){
        
        
        
        let path = "/usr/bin/env"
        let arguments = ["ls", "-l", "/"]
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        
        
//        var env = task.environment ?? [:]
//        if let path = env["PATH"] {
//            env["PATH"] = "/usr/local/bin:" + path
//        } else {
//            env["PATH"] = "/usr/local/bin"
//        }
//        task.environment = env
        
        task.waitUntilExit()
    }
    
    func killThree(){
        
//        NSAppleScript(source: "do shell script \"sudo whatever\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
//        NSAppleScript(source: "do shell script \"sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
//        NSAppleScript(source: "do shell script \"sudo kill 1403\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
//        NSAppleScript(source: "do shell script \"sudo killall TextEdit\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
//        NSAppleScript(source: "do shell script \"sudo killall Terminal\" with administrator " +
//            "privileges")!.executeAndReturnError(nil)
        
        NSAppleScript(source: "do shell script \"sudo  open /Applications/TextEdit.app\" with administrator " +
            "privileges")!.executeAndReturnError(nil)
    }
}

