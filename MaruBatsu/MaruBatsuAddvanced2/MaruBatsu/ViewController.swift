import UIKit

// UITextFieldDelegate 最初はなかったどこから出てきた？

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 下で作った関数を呼び出す。 UILabel に表示する
        showQuestion()
        
        
        
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // 問題番号の変数
    var currentQuestionNum: Int = 0
    
    // 問題を入れる空の配列を変数で作る
    var questions: [[String:Any]] = [[:]]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "qAndA") != nil {
            
            questions = UserDefaults.standard.object(forKey: "qAndA") as! [[String : Any]]
            
            showQuestion()
            
        }
    }
    
    
    
    
    
    //問題を表示する関数
    func showQuestion() {
        //新しい定数questionに配列(currentQuestionNumの値を取り出す(初期値０で設定してるやつ))を格納
        
        //ここで定数として宣言したquestionも辞書になる！！！！！！
        //なぜなら、辞書を格納したから！！！
        
        let question = questions[currentQuestionNum]
        
        
        //定数queを定義して、questionという辞書のなかの["question"]を取り出す！！！
        if let que = question["question"] as? String {
            
            //問題番号がつくようにした
            questionLabel.text = "[問題\(currentQuestionNum + 1)]  " + que
        }
    }
    
    
    
    
    //回答した時の関数を作る！！！！---------------------------------------------
    //Boolの設定はture,falseなどを扱うから(questionsという辞書の(currentQuestionNum)番目の辞書をquestinに格納する。question内の"answer"を取り出す。)
    
    func checkAnswer(yourAnswer: Bool) {
        
        
        
        //新しい定数questionに配列(currentQuestionNumの値を取り出す)を格納
        let question = questions[currentQuestionNum]
        
        
        //questonという配列のなかの"answer"を取り出して、ansという定数に格納する
        if let ans = question["answer"] as? Bool{
            //正解の時
            //上で答えを格納したans（questionの配列から取り出したbool値）と、yourAnswerを比較している
            if yourAnswer == ans {
                currentQuestionNum += 1
                showAlert(message: "正解")
            } else { }
        } else {
            // 不正解の時
            print("こたえがありません")
            return
            
        }
        // 変数 currentQuestionNum question の 並列番号より大きくなったら0にして最初に戻る
        
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        showQuestion()
    }
    
    
    
    
    
 //アラートをつける関数を作る正解バージョン出題音あり---------------------------------------------------------
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        // Alertのか雛形、おぼえる必要なし
        let close = UIAlertAction(title: "とじる", style: .cancel , handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true,completion: nil)
    }
    
    
    
    
    
    // ボタンを押した時、Noであればfalseを入れる
    @IBAction func tappNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    // ボタンを押した時のYesであればtrueを入れる
    @IBAction func tappYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    
    
    
    
    
    
}

