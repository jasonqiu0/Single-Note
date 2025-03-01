//
//  Single_NoteApp.swift
//  Single Note
//
//  Created by Jason Qiu on 3/1/25.
//

import SwiftUI

@main
struct Single_NoteApp: App {
    // link app delegate
    @NSApplicationDelegateAdaptor(AppDeletage.self) var delegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}



// setup menu bar icon & popover
class AppDeletage : NSObject, ObservableObject, NSApplicationDelegate {
    // properties
    @Published var statusItem: NSStatusItem?
    @Published var popover = NSPopover()
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMacMenu()
    }
    
    func setupMacMenu() {
        // popover properties
        popover.animates = true
        popover.behavior = .transient
        
        // connect swiftui view
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: Home())
        
        // make it as key window
        popover.contentViewController?.view.window?.makeKey()
        
        // menu bar icon and action
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let menuButton = statusItem?.button {
            menuButton.image = .init(systemSymbolName: "square.and.pencil", accessibilityDescription: nil)
            menuButton.action = #selector(menuButtonAction(sender:))
        }
    }
    @objc func menuButtonAction(sender: AnyObject) {
        // show/close popover
        if popover.isShown {
            popover.performClose(sender)
        }
        else {
            if let menuButton = statusItem?.button {
                popover.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: .minY)
            }
        }
    }
}

