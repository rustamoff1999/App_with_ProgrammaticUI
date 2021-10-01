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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bearImageView)
        setupLayout()
    }

    private func setupLayout() {
        view.backgroundColor = .white
        
        let layout = view.safeAreaLayoutGuide//SafeArea representation
        bearImageView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: layout.topAnchor, constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

