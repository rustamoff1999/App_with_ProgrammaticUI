//
//  ViewController.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 01.10.21.
//

import UIKit

class ViewController: UIViewController {

    //let's avoid polluting viewDidLoad
    let nikeImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "nikeLogo"))
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()//Anonymous Closure(Here we are writing only those things that'll never change)
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        //:**Creating custom attribute textView(text's attributes)**
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        //Add other text there
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads ands loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:  UIColor.gray]))
        
        //:**Setting text's atttributes**
        textView.attributedText = attributedText
        
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
        //textView.text = "Join us today in our fun and games"
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let topImageContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionTextView)
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(nikeImageView)
        
        setupLayout()
    }

    private func setupLayout() {
        view.backgroundColor = .white
        
        let layout = view.safeAreaLayoutGuide//SafeArea representation
        nikeImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        nikeImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        nikeImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//        nikeImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        nikeImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: 0).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: layout.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }

}

