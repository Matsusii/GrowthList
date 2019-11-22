//
//  AddViewController.swift
//  Growth List[test4]
//
//  Created by 松下怜平 on 2019/10/01.
//  Copyright © 2019 com.iitech. All rights reserved.
//

import UIKit

var individualContents = [String]()


class AddViewController: UIViewController {
    
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var TodoTextField: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        //変数に入力内容を入れる
        individualContents.append(TodoTextField.text!)
        //フィールドを空にする
        TodoTextField.text = ""
        //変数の中身をユーザーデフォルトに追加
        UserDefaults.standard.set(individualContents, forKey: "todoList")
        performSegue(withIdentifier: "backList", sender: nil)
    }
    @IBAction func back() {
        performSegue(withIdentifier: "backList", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddButton.layer.cornerRadius = 60
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
