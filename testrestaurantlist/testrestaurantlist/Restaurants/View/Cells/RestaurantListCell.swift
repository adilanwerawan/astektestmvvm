//
//  RestaurantListCell.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import UIKit
import Kingfisher

class RestaurantListCell: UICollectionViewCell {
    
    let restaurantImage = UIImageView()
    let restaurantNameLbl = UILabel()
    let restaurantDitanceLbl = UILabel()
    let ratingView = StarRatingView()
    
    var cellViewModel: RestaurantCellViewModel? {
        didSet {
            if let url = cellViewModel?.getImageURL() {
                restaurantImage.kf.setImage(with: url)
            }
            restaurantNameLbl.text = cellViewModel?.name
            restaurantDitanceLbl.text = cellViewModel?.getDictance()
            ratingView.current = CGFloat(cellViewModel?.rating ?? 0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        restaurantImage.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLbl.translatesAutoresizingMaskIntoConstraints = false
        restaurantDitanceLbl.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        restaurantImage.contentMode = .scaleAspectFit
        restaurantDitanceLbl.textColor = .darkGray
        
        contentView.addSubview(restaurantImage)
        contentView.addSubview(restaurantNameLbl)
        contentView.addSubview(restaurantDitanceLbl)
        contentView.addSubview(ratingView)
        
        let attribute = StarRatingAttribute(type: .rate,
              point: 15,
              spacing: 3,
              emptyColor: .lightGray,
              fillColor: UIColor.darkYellow,
              emptyImage: nil,
              fillImage: nil)
        
        ratingView.configure(attribute, current: 0, max: 10)
        ratingView.isUserInteractionEnabled = false
        contentView.addSubview(ratingView)
        
        let imageViewHeight:CGFloat = 80.0
        let interItemVerticalSpacing:CGFloat = 4.0
        
        restaurantImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        restaurantImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        restaurantImage.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
        restaurantImage.widthAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
        
        restaurantNameLbl.leftAnchor.constraint(equalTo: restaurantImage.rightAnchor, constant: 8).isActive = true
        restaurantNameLbl.topAnchor.constraint(equalTo: restaurantImage.topAnchor, constant: interItemVerticalSpacing).isActive = true
        
        restaurantDitanceLbl.leftAnchor.constraint(equalTo: restaurantNameLbl.leftAnchor).isActive = true
        restaurantDitanceLbl.topAnchor.constraint(equalTo: restaurantNameLbl.bottomAnchor, constant: interItemVerticalSpacing).isActive = true
        
        ratingView.leftAnchor.constraint(equalTo: restaurantDitanceLbl.leftAnchor).isActive = true
        ratingView.topAnchor.constraint(equalTo: restaurantDitanceLbl.bottomAnchor, constant: interItemVerticalSpacing).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        restaurantImage.image = nil
        restaurantNameLbl.text = nil
        restaurantDitanceLbl.text = nil
        ratingView.current = 0
    }
}
