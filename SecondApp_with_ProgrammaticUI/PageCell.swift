//
//  PageCell.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 06.10.21.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let nikeImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "nikeLogo"))
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()//Anonymous Closure(Here we are writing only those things that'll never change)
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        //:**Creating custom attribute textView(text's attributes)**
        let attributedText = NSMutableAttributedString(string: "Just do it.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        //Add other text there
        attributedText.append(NSAttributedString(string: "\nThe tenacity of athletes and their spirit of pushing through adversity will win out in the end, and a global pandemic won't stop sports.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:  UIColor.gray]))
        
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(nikeImageView)
        addSubview(descriptionTextView)
        
        nikeImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        nikeImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        nikeImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//        nikeImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        nikeImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
}
