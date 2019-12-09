//
//  LobbyViewController.swift
//  Growth List[test4]
//
//  Created by 松下怜平 on 2019/11/01.
//  Copyright © 2019 com.iitech. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    var experience: Int = 0
    var remaining: Int = 0
    
    @IBOutlet var experienceLabel: UILabel!
    @IBOutlet var charaImageView: UIImageView!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var remainingLabel: UILabel!
    
    @IBAction func toList(){
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
    @IBAction func share() {
        let shareText = "今の経験値は\(experience)、役職は\(positionLabel.text!)だよ"
        let shareImage = charaImageView.image
        let activityItems: [Any] = [shareText, shareImage!]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let excloudActivityTypes = [UIActivity.ActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewController.excludedActivityTypes = excloudActivityTypes
        activityViewController.popoverPresentationController?.sourceView = self.view;
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 100.0, height: 100.0)
        present(activityViewController, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "lobby-experience") != nil {
            experience = UserDefaults.standard.object(forKey: "lobby-experience") as! Int
        }
        experienceLabel.text = String(experience)
        imagechange()
        remainingLabel.text = "あと\(remaining)個達成で進化"
        self.overrideUserInterfaceStyle = .light
    }
    
    func imagechange() {
                if experience < -20{
                    charaImageView.image = UIImage(named: "みじんこ微塵粉.png")
                    positionLabel.text = "みじんこ"
                    remaining = 10 - experience
                }else if experience < 0{
                    charaImageView.image = UIImage(named: "魚.png")
                    positionLabel.text = "魚"
                    remaining = 10 - experience
              }else if experience < 10{
                   charaImageView.image = UIImage(named: "原始人１.png")
                   positionLabel.text = "原始人"
                   remaining = 10 - experience
               }else if experience < 20{
                   charaImageView.image = UIImage(named: "現代人.png")
                   positionLabel.text = "現代人"
                   remaining = 20 - experience
               }else if experience < 40 {
                   charaImageView.image = UIImage(named: "アスリート.png")
                   positionLabel.text = "アスリート"
                   remaining = 40 - experience
               }else if experience < 60 {
                   charaImageView.image = UIImage(named: "歌手.png")
                   positionLabel.text = "歌手"
                   remaining = 60 - experience
               }else if experience < 80 {
                   charaImageView.image = UIImage(named: "スター.png")
                   positionLabel.text = "スーパースター"
                   remaining = 80 - experience
               }else if experience < 100 {
                   charaImageView.image = UIImage(named: "総理大臣.png")
                   positionLabel.text = "総理大臣"
                   remaining = 100 - experience
               }else if experience < 150 {
                   charaImageView.image = UIImage(named: "スーパーヒーロー.png")
                   positionLabel.text = "スーパーヒーロー"
                   remaining = 150 - experience
               }else if experience < 200 {
                   charaImageView.image = UIImage(named: "神様.png")
                   positionLabel.text = "神"
                   remaining = 200 - experience
               }
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


