//
//  ViewController.swift
//  Growth List[test4]
//
//  Created by 松下怜平 on 2019/09/30.
//  Copyright © 2019 com.iitech. All rights reserved.
//

import UIKit

var experiencePoint: Int = 0
var individualContents = [String]()

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
       @IBOutlet var todoTextField: UITextField!
        @IBOutlet var todoTableView: UITableView!
    
       override func viewDidLoad() {
           super.viewDidLoad()
        todoTableView.register(UINib(nibName: "TodoCell", bundle: nil), forCellReuseIdentifier: "TodoCell")
           dateread()
        self.overrideUserInterfaceStyle = .light
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individualContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        todoCell.cellControl(indexPath: indexPath)
        return todoCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert: UIAlertController = UIAlertController(title: "タスクの削除", message: "このタスクを削除しますか？達成すれば経験値が１上がり、諦めれば１下がります", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "達成", style: .default, handler: { action in
            individualContents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.set(individualContents, forKey: "todoList")
            experiencePoint = experiencePoint + 1
            UserDefaults.standard.set(experiencePoint, forKey: "list-experience")
        }))
        alert.addAction(UIAlertAction(title: "諦める", style: .default, handler: { action in
            individualContents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.set(individualContents, forKey: "todoList")
            experiencePoint = experiencePoint - 1
            UserDefaults.standard.set(experiencePoint, forKey: "list-experience")
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func toLobby() {
        performSegue(withIdentifier: "toLobby", sender: nil)
    }

     @IBAction func Add(_ sender: Any) {
           individualContents.append(todoTextField.text!)
           todoTextField.text = ""
           UserDefaults.standard.set(individualContents, forKey: "todoList")
        if UserDefaults.standard.object(forKey: "todoList") != nil {
            individualContents = UserDefaults.standard.object(forKey: "todoList") as! [String]
        }
        todoTableView.reloadData()
    }
    
    @IBAction func textreset() {
        todoTextField.text = ""
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


