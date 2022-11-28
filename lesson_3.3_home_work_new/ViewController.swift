import UIKit
/*
 Домашнее задание №3. TableView.

 Создать список чатов. Заполнить картинками и именами чатов и последним сообщением. По клику на ячейку открывать новое окно с переданными информациями. Информацию отобразить в labelax и imageView.
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    var contacts: [String] = ["Akai", "Anjella", "Atai", "Eldar", "Farhat", "Keremet", "Nurmuhammed", "Nursultan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contacts_cell")
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts_cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        navigationController?.pushViewController(chatVC, animated: true)
        let person = contacts[indexPath.row]
        chatVC.name = person
    }
}

