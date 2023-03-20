//
//  TableViewCell.swift
//  NajlepszeRzeczySklep
//
//  Created by Mariusz Dziuba on 05/02/2023.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var imageView_001: UIImageView!
    
    @IBOutlet weak var textField_001: UITextField!
    
    @IBOutlet weak var textField_002: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureTableViewCell_001 (with image: UIImage, name nazwaProduktu: String, price cenaProduktu: Double) {
        imageView_001.image = image
        textField_001.text = nazwaProduktu
        let sformatowanaCena = String(format: "%.2f", cenaProduktu)
        textField_002.text = String("\(sformatowanaCena) zł.")
        
    }
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
}
