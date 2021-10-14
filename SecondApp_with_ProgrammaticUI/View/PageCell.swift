//
//  PageCell.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 06.10.21.
//

import UIKit

extension UIColor {
    static var mainPinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else {
                return
            }
            imageView.image = UIImage(named: unwrappedPage.imageName)
            
            //:**Creating custom attribute textView(text's attributes)**
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            //Add other text there
            attributedText.append(NSAttributedString(string: "\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:  UIColor.gray]))
            
            //:**Setting text's atttributes**
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()//Anonymous Closure(Here we are writing only those things that'll never change)
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
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
        topImageContainerView.addSubview(imageView)
        addSubview(descriptionTextView)
        
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
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
