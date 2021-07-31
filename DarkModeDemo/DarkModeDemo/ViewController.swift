//
//  ViewController.swift
//  DarkModeDemo
//
//  Created by SHUBHAM AGARWAL on 21/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
    }
    
    
    @IBAction func moveOnSecondViewControlle(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let model = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                product = model.response
                navigationItem.title = product?.categoryName
                
            } catch {
                // handle error
            }
        }
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListingTableViewCell") as? ProductListingTableViewCell else {
            return UITableViewCell()
        }
        cell.name.text = product?.products?[indexPath.row].name
        cell.productImage.image = UIImage(named: product?.products?[indexPath.row].imageName ?? "")
        cell.price.text = product?.products?[indexPath.row].price
        cell.productDescription.text = product?.products?[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController else {return}
        vc.product = product?.products?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
