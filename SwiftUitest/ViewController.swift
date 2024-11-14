//
//  ViewController.swift
//  SwiftUitest
//
//  Created by user@59 on 20/08/1946 Saka.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var searchedCafes : [Cafe] = cafes
    var selectedCafes : Cafe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        
        searchBar.delegate = self
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchedCafes = cafes
        } else  {
            searchedCafes = cafes.filter { cafe in
                cafe.CafeName.lowercased().contains(searchText.lowercased())
            }
        }
        
        listCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchedCafes = cafes
        searchBar.text = ""
        listCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchedCafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.setUp(with: searchedCafes[indexPath.row])
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 361, height: 128)
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCafes = searchedCafes[indexPath.row]
        print("Selected : \(selectedCafes?.CafeName ?? "No Cafe")")
        
        performSegue(withIdentifier: "showDetails", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
       let detailVC = segue.destination as? DetailViewController {
            detailVC.cafe = selectedCafes
            print("\(selectedCafes?.CafeName ?? "No Cafe")")
        }
    }

       // print(cafes[indexPath.row].CafeName)
    }
    



