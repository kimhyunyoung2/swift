//
//  ViewController.swift
//  RPSGame
//
//  Created by KHY on 2022/05/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLb: UILabel!
    
    @IBOutlet weak var comIV: UIImageView!
    @IBOutlet weak var myIV: UIImageView!
    
    @IBOutlet weak var comChoiceLb: UILabel!
    @IBOutlet weak var myChoiceLb: UILabel!
    
    var myChoice: RPS = RPS.ready
    var comChoice: RPS = RPS(rawValue: Int.random(in: 0...2))!
    
    // RPS index에 따라 순서 맞춤
    let rpsDataArr: [(imageName: String, text: String)] = [
        ("scissors.png", "가위"),
        ("rock.png", "바위"),
        ("paper.png", "보"),
        ("ready.png", "준비")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.comIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
        self.comChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
        
        self.myIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
        self.myChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 선택된 버튼 저장
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myChoice = RPS.scissors
        case "바위":
            myChoice = RPS.rock
        case "보":
            myChoice = RPS.paper
        default:
            myChoice = RPS.ready
        }
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 선택된 정보를 비교해서 승패 결정
        // 컴퓨터 선택
        switch comChoice {
        case RPS.rock:
            comIV.image = UIImage(named: rpsDataArr[RPS.rock.rawValue].imageName)
            comChoiceLb.text = rpsDataArr[RPS.rock.rawValue].text
        case RPS.paper:
            comIV.image = UIImage(named: rpsDataArr[RPS.paper.rawValue].imageName)
            comChoiceLb.text = rpsDataArr[RPS.paper.rawValue].text
        case RPS.scissors:
            comIV.image = UIImage(named: rpsDataArr[RPS.scissors.rawValue].imageName)
            comChoiceLb.text = rpsDataArr[RPS.scissors.rawValue].text
        default:
            comIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
            comChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
        }
        
        // 내선택
        switch myChoice {
        case RPS.rock:
            myIV.image = UIImage(named: rpsDataArr[RPS.rock.rawValue].imageName)
            myChoiceLb.text = rpsDataArr[RPS.rock.rawValue].text
        case RPS.paper:
            myIV.image = UIImage(named: rpsDataArr[RPS.paper.rawValue].imageName)
            myChoiceLb.text = rpsDataArr[RPS.paper.rawValue].text
        case RPS.scissors:
            myIV.image = UIImage(named: rpsDataArr[RPS.scissors.rawValue].imageName)
            myChoiceLb.text = rpsDataArr[RPS.scissors.rawValue].text
        default:
            myIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
            myChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
        }

        if comChoice == myChoice {
            mainLb.text = "비겼다"
        } else if (comChoice == .rock && myChoice == .paper) ||
                    (comChoice == .paper && myChoice == .scissors) ||
                    (comChoice == .scissors && myChoice == .rock) {
            mainLb.text = "이겼다"
        } else {
            mainLb.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화
        comIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
        comChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
        
        myIV.image = UIImage(named: rpsDataArr[RPS.ready.rawValue].imageName)
        myChoiceLb.text = rpsDataArr[RPS.ready.rawValue].text
        
        mainLb.text = "선택하세요"
        
        comChoice = RPS(rawValue: Int.random(in: 0...2))!
    }
    
}

