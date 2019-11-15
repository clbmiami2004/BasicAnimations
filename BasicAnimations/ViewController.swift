//
//  ViewController.swift
//  BasicAnimations
//
//  Created by Lambda_School_Loaner_201 on 11/14/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        label.center = view.center
    }
    
    func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200)) //Upper left corner of the screen
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.text = "🎅"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 12
        
    }
    
    func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotateButton)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let sprintButton = UIButton(type: .system)
        sprintButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sprintButton)
        sprintButton.setTitle("Spring", for: .normal)
        sprintButton.addTarget(self, action: #selector(sprintButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(sprintButton)
        
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func rotateButtonTapped() {
        label.center = view.center
        
        UIView.animate(withDuration: 2.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        }) { (_) in
            UIView.animate(withDuration: 2.0) {
                self.label.transform = .identity
            }
        }
        
    }
    
    @objc func sprintButtonTapped() {
        label.center = view.center
        
        ;label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    
}


