import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
// 下で作った関数を呼び出す。 UILabel に表示する
        showQuestion()
    
    }
    
    @IBOutlet weak var questionLabel: UILabel!
 
// 問題番号の変数
    var currentQuestionNum: Int = 0
 
    
// 問題の並列を作る。真偽値でチェック。並列の中に辞書だからダブル[] 中の[]は辞書
    let questions: [[String:Any]] = [
        
        
        
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]




    ]
    
    
//問題を表示する関数
    func showQuestion() {
        //問題(単体)の定数を作って 問題の並列[問題番号]
        let question = questions[currentQuestionNum]
 //これは問題番号の変数がにnil出ない場合、並列questuinsのか中から個別questionwo引き出す。
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
        
    }
    
// 正誤をチェックする計算
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans {
// 正解
                currentQuestionNum += 1
                showAlert(message: "正解")
            } else { }
        } else {
// 不正解
            print("こたえがありません")
            return
            
        }
// 変数 currentQuestionNum question の 並列番号より大きくなったら0にして最初に戻る
        
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        showQuestion()
    }
    
    
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

