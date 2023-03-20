//
//  CollectionViewCell_002.swift
//  NajlepszeRzeczySklep
//
//  Created by Mariusz Dziuba on 19/01/2023.
//

import UIKit

class CollectionViewCell_002: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField_01: UITextField!
    @IBOutlet var textField_02: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configureImageCell_01(with image: UIImage, name nazwaProduktu: String, price cenaProduktu: Double){
        imageView.image = image
        textField_01.text = nazwaProduktu
        let sformatowanaCena = String(format: "%.2f", cenaProduktu)
        textField_02.text = String("\(sformatowanaCena) zł.")
        
    
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell_002", bundle: nil)
    }

}
