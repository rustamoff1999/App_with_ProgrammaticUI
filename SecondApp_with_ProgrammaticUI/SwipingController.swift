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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true//collection view is now looking like pages
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //indexPath specifies the location of the item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        //indexPath.item is 0 for the first cell, 1 - for the second cell and so on
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .purple : .yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
