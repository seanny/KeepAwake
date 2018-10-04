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
	private var caffeineProcess:Process?
	
	func launchCaffeinate()
	{
		if (isRunning)
		{
			print("Caffeine is already running")
			return
		}
		caffeineProcess = caffeineTask()
	}
	
	var isRunning:Bool
	{
		return (caffeineProcess?.isRunning ?? false)
	}
	
	func stopCaffeinate()
	{
		if (isRunning)
		{
			print("Caffeine stopped")
			caffeineProcess?.terminate()
		}
	}
	
	private func caffeineTask() -> Process?
	{
		let task = Process()
		task.launchPath = "/usr/bin/caffeinate"
		task.arguments = ["-d"]
		task.launch()
		return task
	}
}
