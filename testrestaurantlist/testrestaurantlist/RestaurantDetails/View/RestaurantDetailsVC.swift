//
//  RestaurantDetailsVC.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import UIKit
import Kingfisher

class RestaurantDetailsVC: UIViewController {

    let restaurantImage = UIImageView()
    let restaurantNameLbl = UILabel()
    let descriptionLbl = UILabel()
    let restaurantHoursLbl = UILabel()
    let ratingView = StarRatingView()
    
    var viewModel:RestaurantDetailsViewModel!{
        didSet {
            if let url = viewModel?.getImageURL() {
                restaurantImage.kf.setImage(with: url)
            }
            restaurantNameLbl.text = viewModel?.name
            restaurantHoursLbl.text = viewModel?.hours
            descriptionLbl.text = viewModel?.descriptionField
            ratingView.current = viewModel.getRating()
        }
    }
    var router: Router!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let containerView = UIView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        addSubviews(toView: containerView)
    }
    
    func addSubviews(toView: UIView){
        
        restaurantImage.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLbl.translatesAutoresizingMaskIntoConstraints = false
        descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        restaurantHoursLbl.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImage.contentMode = .scaleAspectFit
        
        toView.addSubview(restaurantImage)
        toView.addSubview(restaurantNameLbl)
        toView.addSubview(descriptionLbl)
        toView.addSubview(restaurantHoursLbl)
        toView.addSubview(ratingView)
        
        let imageViewWidth:CGFloat = toView.frame.size.width
        let imageViewHeight:CGFloat = toView.frame.size.width
        let interItemVerticalSpacing:CGFloat = 8.0
        let interItemHorizontalSpacing:CGFloat = 8.0
        
        restaurantImage.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: 0).isActive = true
        restaurantImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: interItemVerticalSpacing).isActive = true
        restaurantImage.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
        restaurantImage.widthAnchor.constraint(equalToConstant: imageViewWidth).isActive = true
        
        restaurantNameLbl.leftAnchor.constraint(equalTo: restaurantImage.leftAnchor, constant: 8).isActive = true
        restaurantNameLbl.sizeToFit()
        restaurantNameLbl.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: interItemVerticalSpacing).isActive = true
        
        descriptionLbl.leftAnchor.constraint(equalTo: restaurantNameLbl.rightAnchor, constant: 4.0).isActive = true
        descriptionLbl.topAnchor.constraint(equalTo: restaurantNameLbl.topAnchor, constant: 0).isActive = true
        descriptionLbl.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: 4.0).isActive = true
        descriptionLbl.numberOfLines = 0
        
        restaurantHoursLbl.leftAnchor.constraint(equalTo: restaurantNameLbl.leftAnchor).isActive = true
        restaurantHoursLbl.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: interItemVerticalSpacing).isActive = true
        
        ratingView.leftAnchor.constraint(equalTo: restaurantHoursLbl.rightAnchor, constant: interItemHorizontalSpacing).isActive = true
        ratingView.topAnchor.constraint(equalTo: restaurantHoursLbl.topAnchor, constant: 0).isActive = true
        
        
        restaurantHoursLbl.font = .systemFont(ofSize: 11.0)
        restaurantHoursLbl.textColor = .darkGray
        
        let attribute = StarRatingAttribute(type: .rate,
              point: 13,
              spacing: 3,
              emptyColor: .lightGray,
              fillColor: UIColor.darkYellow,
              emptyImage: nil,
              fillImage: nil)
        
        ratingView.configure(attribute, current: 0, max: 10)
        ratingView.isUserInteractionEnabled = false
        
        restaurantNameLbl.font = .systemFont(ofSize: 17.0, weight: .medium)
        
        if let url = viewModel?.getImageURL() {
            restaurantImage.kf.setImage(with: url)
        }
        restaurantNameLbl.text = viewModel?.name
        restaurantHoursLbl.text = viewModel?.hours
        descriptionLbl.text = viewModel?.descriptionField
        ratingView.current = viewModel.getRating()
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
