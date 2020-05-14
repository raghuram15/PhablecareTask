//
//  CreateContactViewController.swift
//  PhableCareTask
//
//  Created by Raghuram on 13/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import UIKit

import RealmSwift

class CreateContactViewController: UIViewController {
    
    
    let realm = try! Realm()
    var newContact = Contact()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Contact"
        tableView.register(CreateContactViewCell.self, forCellReuseIdentifier: "contactsView")
       
        view.addSubview(tableView)
        setTableViewCons()
        tableView.delegate = self
        tableView.dataSource = self
        
       // tableView
        
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAct))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
    }
    
    @objc func saveAct(){
        
        let indexPath = IndexPath(row:1, section:0)
        let cell : CreateContactViewCell? = self.tableView.cellForRow(at: indexPath) as! CreateContactViewCell?
        cell?.inputField.resignFirstResponder()
        
        
        
        saveContact(contact: newContact)
        print("clicked \(newContact)")
        self.dismiss(animated: true, completion: nil)
    }
        
    
    func saveContact(contact: Contact){
        
        if contact.name == "" || contact.phoneNum == "" {
            return
            
        }
        do {
            
            try realm.write{
                realm.add(contact)
            }
        }catch {
            print("error")
        }
        }
    
    

   let iconNames = ["person.fill","phone.fill"]
    
    
   var tableView: UITableView = {
          
          
          let tblView = UITableView()
          tblView.translatesAutoresizingMaskIntoConstraints = false
          return tblView
      }()
    
    func setTableViewCons() {
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20).isActive = true
    }
    
    
}



extension CreateContactViewController : UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        print(textField.tag)

        switch textField.tag {
        case 0:
            newContact.name = textField.text ?? ""

        case 1:
             newContact.phoneNum = textField.text ?? ""
        default:
           print("default")
        }

       
    }
    
    
    
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField.tag == 0 {
//            textField.keyboardType = .default
//        }else{
//            textField.keyboardType = .numberPad
//        }
//    }
}

extension CreateContactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsView", for: indexPath) as! CreateContactViewCell
        cell.inputField.delegate = self
        cell.inputField.tag = indexPath.row
        cell.icon.image = UIImage(systemName: iconNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    
}
