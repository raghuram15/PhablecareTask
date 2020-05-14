//
//  CreateContactViewCell.swift
//  PhableCareTask
//
//  Created by Raghuram on 13/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import UIKit

class CreateContactViewCell: UITableViewCell {

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
        baseView.addSubview(icon)
        baseView.addSubview(inputField)
        
        setBaseViewCons()
        iconCons()
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
    
    var icon : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var inputField : UITextField = {
        
        let label = UITextField()
        label.placeholder = "Enter your text here"
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
    
    func iconCons() {
        icon.centerYAnchor.constraint(equalTo: baseView.centerYAnchor, constant: 2).isActive = true
        icon.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 5).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setTitleLabelCons(){
        
        inputField.topAnchor.constraint(equalTo: baseView.topAnchor, constant : 12).isActive     = true
        inputField.leadingAnchor.constraint(equalTo:  icon.trailingAnchor, constant : 10).isActive   = true
        inputField.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5).isActive  = true
    }
    

}
