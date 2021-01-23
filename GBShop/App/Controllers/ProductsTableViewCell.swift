//
//  ProductsTableViewCell.swift
//  GBShop
//
//  Created by Vit K on 19.01.2021.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var productNameLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(product : Product){
        self.productNameLabel.text = product.product_name
        self.priceLabel.text = "\(product.price)"
    }
    
    func configureFor(review : Review){
        self.productNameLabel.text = review.text
        self.priceLabel.text = "User"
    }
}
