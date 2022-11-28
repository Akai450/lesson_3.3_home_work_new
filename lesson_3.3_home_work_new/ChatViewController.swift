import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var messageTableView: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    var name: String = ""
    
    var messages: [String] = ["Привет, как дела?😊", "Привет, отлично👍, как твои?", "Домашку по tablew view сделал😅?", "Еще нет, вот сижу второй час пытаюсь начать😭, а ты?", "Ну что-то получается, что-то нет, ошибки сижу исправляю😭"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        messageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "message_cell")
        messageTableView.dataSource = self
        messageTableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message_cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }


}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
/*
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 let chatVC = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
 navigationController?.pushViewController(chatVC, animated: true)
 let person = contacts[indexPath.row]
 chatVC.name = person
 }
 }
 */
