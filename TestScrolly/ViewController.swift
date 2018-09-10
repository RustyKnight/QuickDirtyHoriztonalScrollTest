//
//  ViewController.swift
//  TestScrolly
//
//  Created by Shane Whitehead on 10/9/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var stacky: UIStackView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func addStuff(_ sender: Any) {
		let label = UILabel()
		label.text = "Hello"
		
		stacky.addArrangedSubview(label)
	}
	
}

