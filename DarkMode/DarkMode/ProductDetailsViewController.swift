//
//  ProductDetailsViewController.swift
//  EcommerceApp
//
//  Created by SHUBHAM AGARWAL on 28/01/21.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var product: ProductDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = product?.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }

}

extension ProductDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListingTableViewCell") as? ProductListingTableViewCell else {
            return UITableViewCell()
        }
        cell.name.text = product?.name
        cell.productImage.image = UIImage(named: product?.imageName ?? "")
        cell.price.text = product?.price
        cell.productDescription.text = product?.description
       
        return cell
    }
    
}
