//
//  CollectionViewCell_001.swift
//  NajlepszeRzeczySklep
//
//  Created by Mariusz Dziuba on 03/01/2023.
//

import UIKit

class CollectionViewCell_001: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureImageCell_01(with image: UIImage, named tekstKategorii: String){
        imageView.image = image
        textField.text = tekstKategorii
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell_001", bundle: nil)
    }
}
