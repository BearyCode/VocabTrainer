//
//  ViewController.swift
//  VocabTrainer
//
//  Created by Mathias Rettinger on 18.05.21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Variables, Arrays
	
	private var wordsToLearn: Dictionary = [String:String]()
	
	private var correctAnswer: Array = [String]()
	
	private var wrongAnswer: Array = [String]()
	
	// MARK: - Elements
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "VocabTrainer"
		label.textColor = .whiteText
		label.font = .systemFont(ofSize: 40, weight: .bold)
		label.numberOfLines = 0
		label.layer.masksToBounds = false
		return label
	}()
	
	private let wordLabel: UILabel = {
		let label = UILabel()
		label.text = "Word"
		label.textColor = .whiteText
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 22, weight: .regular)
		label.numberOfLines = 0
		label.layer.masksToBounds = true
		label.layer.cornerRadius = 8
		label.backgroundColor = .secondBackgroundBlue
		label.isHidden = true
		return label
	}()
	
	private let correctLabel: UILabel = {
		let label = UILabel()
		label.text = "Correct: 0"
		label.textColor = .whiteText
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20, weight: .regular)
		label.isHidden = true
		return label
	}()
	
	private let wrongLabel: UILabel = {
		let label = UILabel()
		label.text = "Wrong: 0"
		label.textColor = .whiteText
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20, weight: .regular)
		label.isHidden = true
		return label
	}()
	
	private let countLabel: UILabel = {
		let label = UILabel()
		label.text = "1 / 10"
		label.textColor = .whiteText
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20, weight: .thin)
		label.isHidden = true
		return label
	}()
	
	private let addWordButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(systemName: "plus.square"), for: .normal)
		button.contentMode = .scaleAspectFit
		button.contentHorizontalAlignment = .fill
		button.contentVerticalAlignment = .fill
		button.tintColor = .whiteText
		button.addTarget(self, action: #selector(addWord), for: .touchUpInside)
		button.isHidden = false
		return button
	}()
	
	private let startButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .secondBackgroundBlue
		button.layer.cornerRadius = 8
		button.layer.borderWidth = 3
		button.layer.borderColor = UIColor.whiteText.cgColor
		button.setTitle("Start", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
		button.tintColor = .whiteText
		button.titleLabel?.textAlignment = .center
		button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
		button.isHidden = false
		return button
	}()
	
	private let stopButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .redStop
		button.layer.cornerRadius = 8
		button.layer.borderWidth = 3
		button.layer.borderColor = UIColor.whiteText.cgColor
		button.setTitle("Stop", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
		button.tintColor = .whiteText
		button.titleLabel?.textAlignment = .center
		button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
		button.isHidden = true
		return button
	}()
	
	private let resultsButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .secondBackgroundBlue
		button.layer.cornerRadius = 8
		button.layer.borderWidth = 3
		button.layer.borderColor = UIColor.whiteText.cgColor
		button.setTitle("Results", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
		button.tintColor = .whiteText
		button.titleLabel?.textAlignment = .center
		button.addTarget(self, action: #selector(resultsButtonTapped), for: .touchUpInside)
		button.isHidden = true
		return button
	}()
	
	private let answerTextField: UITextField = {
		let textField = UITextField()
		textField.textColor = .whiteText
		textField.textAlignment = .center
		textField.font = .systemFont(ofSize: 22, weight: .regular)
		textField.placeholder = "Your Solution"
		textField.returnKeyType = .done
		textField.backgroundColor = .secondBackgroundBlue
		textField.layer.cornerRadius = 8
		textField.layer.masksToBounds = true
		textField.isHidden = true
		return textField
	}()
	
	private let resultView = ResultsView()

	// MARK: - viewDidLoad
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupElements()
	}
	
	// MARK: - Functions
	
	private func setupElements() {
		view.backgroundColor = .backgroundBlue
		view.addSubview(titleLabel)
		view.addSubview(wordLabel)
		view.addSubview(correctLabel)
		view.addSubview(wrongLabel)
		view.addSubview(countLabel)
		view.addSubview(addWordButton)
		view.addSubview(startButton)
		view.addSubview(stopButton)
		view.addSubview(resultsButton)
		view.addSubview(answerTextField)
		view.addSubview(resultView)
		
		// Labels
		titleLabel.frame = CGRect(x: 5, y: view.width/6, width: view.width-10, height: view.width/6)
		wordLabel.frame = CGRect(x: 5, y: view.height/5, width: view.width-10, height: view.height/4)
		correctLabel.frame = CGRect(x: view.width/8, y: view.height/1.35, width: view.width/3, height: view.height/6 - view.height/4)
		wrongLabel.frame = CGRect(x: view.width/2, y: view.height/1.35, width: view.width/3, height: view.height/6 - view.height/4)
		countLabel.frame = CGRect(x: view.width/6, y: view.height/1.5, width: view.width/1.5, height: view.height/6 - view.height/4)
		
		// Buttons
		addWordButton.frame = CGRect(x: view.width/1.10, y: titleLabel.height*1.25, width: 35, height: 30)
		startButton.frame = CGRect(x: 5, y: view.height/3, width: view.width-10, height: view.height/4)
		stopButton.frame = CGRect(x: view.width/6, y: view.height/1.10, width: view.width/1.5, height: view.height/6 - view.height/4)
		resultsButton.frame = CGRect(x: view.width/6, y: view.height/4, width: view.width/1.5, height: view.height/6 - view.height/4)
		
		// TextField
		answerTextField.frame = CGRect(x: view.width/6, y: view.height/1.75, width: view.width/1.5, height: view.height/6 - view.height/4)
		
		self.answerTextField.delegate = self
		
		// View
		resultView.frame = CGRect(x: 5, y: view.height/3.5, width: view.width-10, height: view.height/2)
	}
	
	private func answerCorrect() {
		correctAnswer.append(wordLabel.text!)
		wordsToLearn.removeValue(forKey: wordLabel.text!)
		correctLabel.text = "Correct: \(correctAnswer.count)"
		countLabel.text = "Words left: \(wordsToLearn.count)"
		answerTextField.text = ""
	}
	
	private func answerFalse() {
		wrongAnswer.append(wordLabel.text!)
		wordsToLearn.removeValue(forKey: wordLabel.text!)
		wrongLabel.text = "Wrong: \(wrongAnswer.count)"
		countLabel.text = "Words left: \(wordsToLearn.count)"
		answerTextField.text = ""
	}
	
	private func emptyWordsToLearn() {
		// once the user is finished, all correct and wrong answerd words can be seen, with the results button
	
		wordLabel.isHidden = true
		answerTextField.isHidden = true
		countLabel.isHidden = true
		resultsButton.isHidden = false
		
		stopButton.setTitle("Home", for: .normal)
		countLabel.text = "Words left: \(wordsToLearn.count)"
		
		stopButton.backgroundColor = .secondBackgroundBlue
		
		correctLabel.frame = CGRect(x: view.width/8, y: view.height/2, width: view.width/3, height: view.height/6 - view.height/4)
		correctLabel.font = .systemFont(ofSize: 25, weight: .regular)
		
		wrongLabel.frame = CGRect(x: view.width/2, y: view.height/2, width: view.width/3, height: view.height/6 - view.height/4)
		wrongLabel.font = .systemFont(ofSize: 25, weight: .regular)
	}
	
	// MARK: - @objc Functions
	
	@objc private func startButtonTapped() {
		// After some words are added the use can start the practise with the start button
		// If there are no words added, the practise can't start and the user gets an alert
		
		if wordsToLearn.isEmpty == false {
			wordLabel.isHidden = false
			correctLabel.isHidden = false
			wrongLabel.isHidden = false
			countLabel.isHidden = false
			addWordButton.isHidden = true
			startButton.isHidden = true
			stopButton.isHidden = false
			answerTextField.isHidden = false
			resultView.isHidden = true
			
			countLabel.text = "Words left: \(wordsToLearn.count)"
			wordLabel.text = wordsToLearn.randomElement()?.key
		} else {
			let alert = UIAlertController(title: "No Words!", message: "Please add some words to practise", preferredStyle: .alert)
			
			let action = UIAlertAction(title: "OK", style: .default)
			
			alert.addAction(action)
			
			present(alert, animated: true, completion: nil)
		}
	}
	
	@objc private func stopButtonTapped() {
		// The stop button pause the practise
		
		wordLabel.isHidden = true
		correctLabel.isHidden = true
		wrongLabel.isHidden = true
		countLabel.isHidden = true
		addWordButton.isHidden = false
		startButton.isHidden = false
		stopButton.isHidden = true
		resultsButton.isHidden = true
		resultsButton.isEnabled = true
		answerTextField.isHidden = true
		resultView.isHidden = true
		
		countLabel.text = "Words left: \(wordsToLearn.count)"
	}
	
	@objc private func addWord() {
		// UIAlert with UITextFields to add words to practise
		
		let alert = UIAlertController(title: "New Word", message: "Add new word to practise", preferredStyle: .alert)
		
		var wordTextField = UITextField()
		var translationTextfield = UITextField()
		
		let action = UIAlertAction(title: "Add", style: .default) { action in
			self.wordsToLearn[wordTextField.text!] = translationTextfield.text!
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { cancelAction in	}
		
		alert.addTextField { textField in
			wordTextField = textField
			wordTextField.placeholder = "Word"
		}
		
		alert.addTextField { textField in
			translationTextfield = textField
			translationTextfield.placeholder = "Translation"
		}
		
		alert.addAction(cancelAction)
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
		
		print(wordsToLearn)
	}
	
	@objc private func resultsButtonTapped() {
		// This fucntion shows which words were answered correctly and which incorrectly
		
		resultsButton.isEnabled = false
		resultView.isHidden = false
		resultView.configureText(correctArray: correctAnswer, wrongArray: wrongAnswer)
	}
}

// MARK: - Extensions: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// After the "done" key on the keyboard is pressed, it checks if the answer is correct.
		
		self.view.endEditing(true)
		
		answerTextField.resignFirstResponder()
		
		guard let answer = answerTextField.text else {
			return false
		}
		
		if answer == wordsToLearn[wordLabel.text!] {
			answerCorrect()
			
			if wordsToLearn.isEmpty {
				emptyWordsToLearn()
			} else {
				wordLabel.text = wordsToLearn.randomElement()?.key
				print("Rest: ", wordsToLearn)
				print("Correct: ", correctAnswer)
			}
			
			return false
		} else {
			answerFalse()
			
			if wordsToLearn.isEmpty {
				emptyWordsToLearn()
			} else {
				wordLabel.text = wordsToLearn.randomElement()?.key
				print("Rest: ", wordsToLearn)
				print("Wrong: ", wrongAnswer)
			}
			
			return false
		}
	}
}
