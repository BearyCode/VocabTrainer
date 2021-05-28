//
//  Extensions.swift
//  VocabTrainer
//
//  Created by Mathias Rettinger on 18.05.21.
//

import UIKit

extension UIView {
	var width: CGFloat {
		return frame.size.width
	}
	
	var height: CGFloat {
		return frame.size.height
	}
}

extension UIColor {
	class var backgroundBlue: UIColor {
		return UIColor(red: 67/255, green: 80/255, blue: 108/255, alpha: 1.0)
	}
	
	class var secondBackgroundBlue: UIColor {
		return UIColor(red: 42/255, green: 55/255, blue: 83/255, alpha: 1.0)
	}
	
	class var backgroundShadow: UIColor {
		return UIColor(red: 118/255, green: 131/255, blue: 159/255, alpha: 1.0)
	}
	
	class var whiteText: UIColor {
		return UIColor(red: 233/255, green: 233/255, blue: 235/255, alpha: 1.0)
	}
	
	class var redStop: UIColor {
		return UIColor(red: 153/255, green: 0/255, blue: 0/255, alpha: 1.0)
	}
}
