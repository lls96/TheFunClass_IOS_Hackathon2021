//
//  FilterCollectionViewCell.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/3/21.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    private var filterLabel: UILabel = UILabel()
    private var filterView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.layer.masksToBounds = true
        filterView.layer.cornerRadius = 10
        filterView.backgroundColor = UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        contentView.addSubview(filterView)
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.boldSystemFont(ofSize: 13)
        filterLabel.textColor = .black
        contentView.addSubview(filterLabel)
        
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        filterLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        filterView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(contentView.safeAreaLayoutGuide)
        }

    }
    
    func configure(with filterObject: Filter){
        filterLabel.text = filterObject.name
    }
    
    override var isSelected: Bool {
            didSet {
                super.isSelected = isSelected
                if isSelected{
                    filterView.backgroundColor = UIColor.init(red: 255/255, green: 126/255, blue: 85/255, alpha: 1)
                    filterLabel.textColor = UIColor.white
                } else {
                    filterView.backgroundColor = UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
                    filterLabel.textColor = .black
 
                }
                setNeedsDisplay()
            }
        } 
}
