//
//  EggTimer.swift
//  EggTimer
//
//  Created by Alexander Spirichev on 14/12/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

import Foundation

protocol EggTimerProtocol {
	func timeRemainingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval)
	func timerHasFinished(_ timer: EggTimer)
}

class EggTimer {
	
	var timer: Timer? = nil
	var startTime: Date?
	var duration: TimeInterval = 360 // default = 6 minutes
	var elapsedTime: TimeInterval = 0
	var delegate: EggTimerProtocol?
	
	var isStopped: Bool {
		return timer == nil && elapsedTime == 0
	}
	
	var isPaused: Bool {
		return timer == nil && elapsedTime > 0
	}
	
	@objc dynamic func timerAction() {
		guard let startTime = startTime else { return }
		
		elapsedTime = -startTime.timeIntervalSinceNow
		
		let secondsRemaining = (duration - elapsedTime).rounded()
		
		if secondsRemaining <= 0 {
			resetTimer()
			delegate?.timerHasFinished(self)
		} else {
			delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
		}
	}
	
	func startTimer() {
		startTime = Date()
		elapsedTime = 0
		
		timer = Timer.scheduledTimer(timeInterval: 1,
																 target: self,
																 selector: #selector(timerAction),
																 userInfo: nil,
																 repeats: true)
		timerAction()
	}
	
	func resumeTimer() {
		startTime = Date(timeIntervalSinceNow: -elapsedTime)
		
		timer = Timer.scheduledTimer(timeInterval: 1,
																 target: self,
																 selector: #selector(timerAction),
																 userInfo: nil,
																 repeats: true)
		timerAction()
	}
	
	func stopTimer() {
		timer?.invalidate()
		timer = nil
		
		timerAction()
	}
	
	// 4
	func resetTimer() {
		timer?.invalidate()
		timer = nil
		
		startTime = nil
		duration = 360
		elapsedTime = 0
		
		timerAction()
	}
}
