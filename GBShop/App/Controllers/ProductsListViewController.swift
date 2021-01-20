//
//  ProductsListViewController.swift
//  GBShop
//
//  Created by Vit K on 19.01.2021.
//

import UIKit

class ProductsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    let requestFactory = RequestFactory()
    var products : [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fillProductsList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.capacity ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
        if let products = products {
            cell.configure(product: products[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        addProductToBasketByTap(product: self.products![indexPath.row])
    }
    
    func fillProductsList(){
        let products = requestFactory.makeProductsRequestFactory()
        products.catalogData(categoryId: 1, pageNumber: 5) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.products = result.products
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка загрузки каталога!", message: error.errorDescription ?? "")
                }
            }
        }
    }
    
    func addProductToBasketByTap(product : Product){
        let basket = requestFactory.makeBasketRequestFactory()
        basket.addToBasket(productId: product.id_product, quantity: 1) { response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    self.showAlert(title: "ОК!", message: "Товар добавлен в корзину")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка!", message: error.errorDescription ?? "")
                }
            }
        }
    }
}
