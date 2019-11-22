//
//  ViewController.swift
//  Growth List[test4]
//
//  Created by 松下怜平 on 2019/09/30.
//  Copyright © 2019 com.iitech. All rights reserved.
//

import UIKit

var experiencePoint: Int = 0

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individualContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = individualContents[indexPath.row]
        return TodoCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            individualContents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.set(individualContents, forKey: "todoList")
            experiencePoint = experiencePoint + 1
            UserDefaults.standard.set(experiencePoint, forKey: "list-experience")
        }
    }
    
    @IBAction func toLobby() {
        performSegue(withIdentifier: "toLobby", sender: nil)
    }
    
    @IBAction func toAdd() {
        performSegue(withIdentifier: "toAdd", sender: nil)
    }
    
    @IBAction func reset() {
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dateread()
            // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toLobby") {
            let next = segue.destination as! LobbyViewController
            next.experience = experiencePoint
            UserDefaults.standard.set(next.experience, forKey: "lobby-experience")
        }
    }
    
    func dateread() {
        if UserDefaults.standard.object(forKey: "list-experience") != nil {
                experiencePoint = UserDefaults.standard.object(forKey: "list-experience") as! Int
            }
        if UserDefaults.standard.object(forKey: "todoList") != nil {
                individualContents = UserDefaults.standard.object(forKey: "todoList") as! [String]
            }
        
    }
        
    
}

