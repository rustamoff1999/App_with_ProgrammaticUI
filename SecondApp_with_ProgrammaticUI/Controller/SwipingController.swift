//
//  SwipingController.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 05.10.21.
//

import UIKit

//A Controller that specializes in managing a collection view
//You create a custom UICollectionViewController subclass for each collection view that you want to manage
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var bottomControlsStackView: UIStackView!
    var layout: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true//collection view is now looking like pages
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "CellId")
        
        layout = view.safeAreaLayoutGuide
        setupBottomLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //indexPath specifies the location of the item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! PageCell
        
        //indexPath.item is 0 for the first cell, 1 - for the second cell and so on
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mainPinkColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPinkColor
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    private func setupBottomLayout() {
        bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.axis = .horizontal
        
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 0),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: 0),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func handleNext() {
        let nextPage = min( (pageControl.currentPage + 1) , pages.count-1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handlePrev() {
        let nextPage = max( (pageControl.currentPage - 1), 0)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
