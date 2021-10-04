//
//  ViewController.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 01.10.21.
//

import UIKit

class ViewController: UIViewController {

    //let's avoid polluting viewDidLoad
    let bearImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "bab-pic"))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()//Anonymous Closure(Here we are writing only those things that'll never change)
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.text = "Join us today in our fun and games"
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        setupLayout()
    }

    private func setupLayout() {
        view.backgroundColor = .white
        
        let layout = view.safeAreaLayoutGuide//SafeArea representation
        bearImageView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: layout.topAnchor, constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 0).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: 0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: 0).isActive = true
        
    }

}

