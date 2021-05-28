//
//  AppDelegate.swift
//  VocabTrainer
//
//  Created by Mathias Rettinger on 18.05.21.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let window = UIWindow(frame: UIScreen.main.bounds)
	
		window.rootViewController = ViewController()
		
		window.overrideUserInterfaceStyle = .dark
		window.makeKeyAndVisible()
		
		self.window = window
		
		return true
	}
}

