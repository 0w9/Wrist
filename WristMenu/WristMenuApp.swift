//
//  WristMenuApp.swift
//  WristMenu
//
//  Created by Lennard Dorst on 08.03.22.
//

import SwiftUI

@main
struct WristMenuApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            //ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
            
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView()
        NSApp.windows.first?.orderOut(nil)
        popOver.behavior = .transient
        
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton = statusItem?.button{
            MenuButton.image = NSImage(named: "hand-icon")
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    @objc func MenuButtonToggle() {
        if let menuButton = statusItem?.button{
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }
}
