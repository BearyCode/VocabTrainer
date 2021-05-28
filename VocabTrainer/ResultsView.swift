//
//  ResultsView.swift
//  VocabTrainer
//
//  Created by Mathias Rettinger on 22.05.21.
//

import UIKit

class ResultsView: UIView {
	
	private let correctWordsTextView: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .clear
		textView.font = .systemFont(ofSize: 25, weight: .semibold)
		textView.textColor = .whiteText
		textView.isEditable = false
		return textView
	}()
	
	private let wrongWordsTextView: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .clear
		textView.font = .systemFont(ofSize: 25, weight: .semibold)
		textView.textColor = .whiteText
		textView.isEditable = false
		return textView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(correctWordsTextView)
		addSubview(wrongWordsTextView)
		
		configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		correctWordsTextView.frame = CGRect(x: 5, y: 10, width: width-10, height: height/2)
		wrongWordsTextView.frame = CGRect(x: 5, y: height/2, width: width-10, height: height/2)
	}
	
	private func configureView() {
		backgroundColor = .secondBackgroundBlue
		layer.masksToBounds = true
		layer.cornerRadius = 8
		isHidden = true
	}
	
	func configureText(correctArray: [String], wrongArray: [String]) {
		correctWordsTextView.text = "Correct: \n"
		for i in 0..<correctArray.count {
			correctWordsTextView.text += "\(correctArray[i])\n"
		}
		wrongWordsTextView.text = "Wrong: \n"
		for i in 0..<wrongArray.count {
			wrongWordsTextView.text += "\(wrongArray[i])\n"
			
		}
	}
}
