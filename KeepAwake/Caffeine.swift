//
//  Caffeine.swift
//  KeepAwake
//
//  Created by Sean McElholm on 03/10/2018.
//  Copyright © 2018 Sean McElholm. All rights reserved.
//

import Foundation

final class Caffeine
{
	static var caffeineProcess:Process?
	
	func launchCaffeinate()
	{
		if (isRunning)
		{
			print("Caffeine is already running")
			return
		}
		Caffeine.caffeineProcess = caffeineTask()
	}
	
	var isRunning:Bool
	{
		return (Caffeine.caffeineProcess?.isRunning ?? false)
	}
	
	func stopCaffeinate()
	{
		if (isRunning)
		{
			print("Caffeine stopped")
			Caffeine.caffeineProcess?.terminate()
		}
	}
	
	private func caffeineTask() -> Process?
	{
		let task = Process()
		task.launchPath = "/usr/bin/caffeinate"
		task.arguments = ["-diu"]
		task.launch()
		return task
	}
}
