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
            
            listTableView25.reloadData()
        } catch {
            print("rrrrrrrrrrrrrrrrrrrrrr")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let part99 = parts45[indexPath.row]
        
        performSegue(withIdentifier: "partSegue", sender: part99)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let game = parts45[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(game)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                parts45 = try context.fetch(Parts.fetchRequest())
                listTableView25.reloadData()
            } catch {}
        }
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreatePartViewController
        nextVC.part = sender as? Parts
    }
    
    
}

