import UIKit
import AVFoundation //お音を鳴らすために読み込む

class ViewController: UIViewController {
    // 結果を表示したときに音を出すための再生オブジェクトを格納します
    
    var resultAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    var motionAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var stickView: UIView!
    @IBOutlet weak var stickLabel: UILabel!
    @IBOutlet weak var stickHeight: NSLayoutConstraint!
    @IBOutlet weak var stickBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var bigLabel: UILabel!
    
    
    
    let resultTexts: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSound()
        setupSound2()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    //振った時に音を鳴らすmotionAudioPlayerを呼び出す
        self.motionAudioPlayer.play()
        if motion != UIEvent.EventSubtype.motionShake || overView.isHidden == false {
            //シェイクモーション以外では動作させない, 結果の表示中は動作させない
            return
        }

    // 7つの(resultText 並列 0~6 )数字をランダムで選ぶ → Int にする
        let resultNum = Int(arc4random_uniform(UInt32(resultTexts.count)))
        stickLabel.text = resultTexts[resultNum]
        
        stickBottomMargin.constant = stickHeight.constant * -1
        
        UIView.animate(withDuration: 3, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: {(finished: Bool) in
            
            self.bigLabel.text = self.stickLabel.text
            self.overView.isHidden = false
    // 結果表示のときに音を再生(Play)する！
            self.resultAudioPlayer.play()
            
        })
    }
    
    // 振った時に鳴らす音の準備する関数
    func setupSound2() {
        if let sound = Bundle.main.path(forResource: "bell", ofType: ".mp3") {
            motionAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            // 結果表示のときに音を再生(Play)すると定義
            motionAudioPlayer.prepareToPlay()
        }
    }
    
    
    
    // リトライボタンを押したときの処理
    @IBAction func tapRetryButton(_ sender: Any) {
        overView.isHidden = true
        stickBottomMargin.constant = 0
    }
    
    // 結果表示するときに鳴らす音の準備する関数
    func setupSound() {
        if let sound = Bundle.main.path(forResource: "drum", ofType: ".mp3") {
            resultAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
    // 結果表示のときに音を再生(Play)すると定義
            resultAudioPlayer.prepareToPlay()
        }
    }
    
}



