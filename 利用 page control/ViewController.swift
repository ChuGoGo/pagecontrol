//
//  ViewController.swift
//  利用 page control
//
//  Created by Chu Go-Go on 2021/12/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var selectSegmented: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    
//    先設定你的Array 名稱
    let pokeImage = ["妙蛙種子", "小火龍", "傑尼龜" ]
    let pokemonName = ["001:妙蛙種子", "004:小火龍", "007:傑尼龜"]
    let pokeVoice = ["種子種子", "火龍火龍", "傑尼傑尼"]
//    設定你的Array初始值為0
    var arrayIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokeChange()
    }
//  先設定好Func讓一個動的時候全部跟著動
    func pokeChange() {
        pokeImageView.image = UIImage(named: pokeImage[arrayIndex])
        pokeName.text = pokemonName[arrayIndex]
        selectSegmented.selectedSegmentIndex = arrayIndex
        pageControl.currentPage = arrayIndex
    }


    @IBAction func selectPoke(_ sender: UISegmentedControl) {
        arrayIndex = selectSegmented.selectedSegmentIndex
        pokeChange()
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        arrayIndex = (arrayIndex + 1) % 3
        pokeChange()
        
    }
    
    @IBAction func returnPage(_ sender: UIButton) {
        arrayIndex = (arrayIndex + pokeImage.count - 1) % pokeImage.count
        pokeChange()
    }
    
    @IBAction func pokePage(_ sender: UIPageControl) {
        arrayIndex = (arrayIndex + 1) % 3
        pokeChange()
        
    }
    @IBAction func swipeHand(_ sender: UISwipeGestureRecognizer) {
        arrayIndex = (arrayIndex + 1) % 3
        pokeChange()
        
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        arrayIndex = (arrayIndex + pokeImage.count - 1) % pokeImage.count
        pokeChange()

    }
    
    @IBAction func sound(_ sender: UIButton) {
        let pokeSound = AVSpeechUtterance(string: pokeVoice[arrayIndex])
        pokeSound.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let pokeTalk = AVSpeechSynthesizer()
        pokeTalk.speak(pokeSound)
        pokeChange()
        
        
    }
}

