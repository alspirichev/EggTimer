//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Alexander Spirichev on 14/12/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var startTimerMenuItem: NSMenuItem!
	@IBOutlet weak var stopTimerMenuItem: NSMenuItem!
	@IBOutlet weak var resetTimerMenuItem: NSMenuItem!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		enableMenus(start: true, stop: false, reset: false)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	func enableMenus(start: Bool, stop: Bool, reset: Bool) {
		startTimerMenuItem.isEnabled = start
		stopTimerMenuItem.isEnabled = stop
		resetTimerMenuItem.isEnabled = reset
	}

}

