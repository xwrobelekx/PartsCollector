//
//  ListViewController.swift
//  PartsCollector
//
//  Created by Kamil Wrobel on 2/27/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView25: UITableView!
    
    var parts45 : [Parts] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listTableView25.dataSource = self
        listTableView25.delegate = self
        
     
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        do {
        parts45 = try context.fetch(Parts.fetchRequest())
            print(parts45)
            listTableView25.reloadData()
        } catch {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts45.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let part99 = parts45[indexPath.row]
        
        cell.textLabel?.text = part99.title
        
        cell.imageView?.image = UIImage(data: part99.image as! Data)
        
        return cell
    }
    
    
    
    
}

