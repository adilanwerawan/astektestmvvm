//
//  RestaurantListVC.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import UIKit

class RestaurantListVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionview: UICollectionView!
    var cellId = "RestaurantCellId"
    
    var viewModel:RestaurantsListViewModel!
    var router: Router!
    
    enum Route: String {
          case restaurantDetails
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        layout.scrollDirection = .vertical
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(RestaurantListCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)
        self.title = "Restaurants"
        
        let distanceSortButton = UIBarButtonItem(title: "Sort by distance", style: .plain, target: self, action: #selector(sortByDistance))
        distanceSortButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)
        distanceSortButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .selected)
        distanceSortButton.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
        navigationItem.rightBarButtonItems = [distanceSortButton]
        functionOfViewModel()
    }
    
    @objc func sortByDistance(){
        viewModel.sortRestaurantsByDistance()
    }
    
    func functionOfViewModel() {
        // Get restaurants data
        viewModel.getRestaurants()
        
        // Reload TableView closure
        viewModel.reloadView = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionview.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.restaurantCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! RestaurantListCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        router.route(to: Route.restaurantDetails.rawValue, from: self, parameters: cellVM)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
