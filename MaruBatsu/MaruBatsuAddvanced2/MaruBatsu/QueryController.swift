import UIKit

class QueryController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //テキストフィールド
    @IBOutlet weak var textField: UITextField!
    
    //答え設定のBoolがはいる
    var answer: Bool!
    
    //    yes, noの切り替え UISegmantをActionde制御はUISegmant // https://majintools.com/2018/10/12/segment/
    
    @IBAction func yesNoButton(_ sender: UISegmentedControl) {
    
        switch sender.selectedSegmentIndex {
        case 0:
            answer = false
            
        case 1:
            answer = true
            
        default:
            print("エラー")
            
        }
    }

    //問題とせ正誤が格納される まだわからん
    var data: [[String: Any]] = []
    
    //保存する
    @IBAction func saveQButton(_ sender: Any) {
        
        if textField.text == "" {
            showAlert2(message:
            "問題を追加してください")

        } else {
            var ques = textField.text!

            //配列に入れる
            data.append(["question": ques, "answer" : answer])

            textField.text = ""
            
            
            UserDefaults.standard.set( data, forKey: "qAndA")
        
        }
    }
    
    @IBAction func removeQbutton(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "qAndA")
        showAlert2(message: "すべて削除しました")
        
        
    }
    
    
    
   //アラート関数を作る--------
    func showAlert2(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
