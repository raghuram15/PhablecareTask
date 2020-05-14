//
//  ContsctsViewController.swift
//  PhableCareTask
//
//  Created by Raghuram on 13/05/20.
//  Copyright © 2020 Raghuram. All rights reserved.
//

import UIKit
import RealmSwift
class ContactsViewController: UIViewController {

    
    let realm = try! Realm()
    var database: Database! = nil
    
    
   
      
    
    var contactsArr : Results<Contact>?
    var contactsArr1 : [Contac]?
    
    
    func loadContacts(){
        
        
        
        do {
            
            contactsArr =  realm.objects(Contact.self)
        }catch{
            
            print(error)
        }
        
         self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadContacts()
        // Do any additional setup after loading the view.
        //view.backgroundColor = UIColor.white
        title = "My Contacts"
      let pred =  NSPredicate(format: "name CONTAINS[cd] 'ra'")
       
        
        contactsArr1 = database!.fetch(with: nil, sortDescriptors: [SortDescriptor.name], transformer: { $0.map(Contac.init) })
        print("@@@@\(contactsArr1)")
        
        tableView.register(ContactsViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(searchBar)
        view.addSubview(tableView)
        setBarCons()
        setTableViewCons()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Crete Contact", style: .done, target: self, action: #selector(navigateAct))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
    }
    
    @objc func navigateAct(){
        
       let vc = CreateContactViewController()
        self.navigationController?.pushViewController(vc, animated: true)
         print("clicked")
    }
    
  
    
    var searchBar : UISearchBar = {
        
        let searchView = UISearchBar()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.placeholder = "Search your Contacts here"
        return searchView
    }()
    
    var tableView: UITableView = {
        
        
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()

    
    func setBarCons() {
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    func setTableViewCons() {
        
        tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
  
    
   

}




extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArr?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ContactsViewCell
        
        if let name = contactsArr?[indexPath.row].name{
        
            cell.titleLabel.text = name
            
        }else{
            cell.titleLabel.text = "No Contacts"
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    
}

extension ContactsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {


        contactsArr = contactsArr?.filter("name CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        tableView.reloadData()

    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text?.count == 0 {
            
            loadContacts()
            
            DispatchQueue.main.async{
                searchBar.resignFirstResponder()
            }
        }
    }
}
