//
//  ContactsViewCell.swift
//  PhableCareTask
//
//  Created by Raghuram on 13/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import UIKit

class ContactsViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        
        addSubview(baseView)
        
        baseView.addSubview(titleLabel)
        
        setBaseViewCons()
        setTitleLabelCons()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var baseView : UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    
    var titleLabel : UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
       
        return label
    }()
    
    
    func setBaseViewCons(){
        
        baseView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        baseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        baseView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        baseView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
    }
    
    func setTitleLabelCons(){
        
        titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant : 12).isActive     = true
        titleLabel.leftAnchor.constraint(equalTo:  baseView.leftAnchor, constant : 5).isActive   = true
        titleLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5).isActive  = true
    }
}
