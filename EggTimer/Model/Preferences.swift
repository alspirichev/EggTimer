//
//  Preferences.swift
//  EggTimer
//
//  Created by Alexander Spirichev on 14/12/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

import Foundation

struct Preferences {
	
	var selectedTime: TimeInterval {
		get {
			let savedTime = UserDefaults.standard.double(forKey: "selectedTime")
			if savedTime > 0 {
				return savedTime
			}
			
			return 360
		}
		set {
			UserDefaults.standard.set(newValue, forKey: "selectedTime")
		}
	}
	
}
