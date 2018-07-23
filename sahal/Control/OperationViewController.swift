

import UIKit

class OperationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    var data = [OperationModel(headerTitle: "العمليات الجديدة", subType: ["العملية الأولى . ", "العملية الثانية ", "العملية الثالثة "  ], isExbanable: true) ,
                OperationModel(headerTitle: "العمليات السابقة", subType: ["العملية الأولى . ", "العملية الثانية ", "العملية الثالثة "  ], isExbanable: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
       
    }

    
}

extension OperationViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = OperationHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width , height: 40 ))
        headerView.delegate = self
        headerView.secondIndex = section
        headerView.btn.setTitle(data[section].headerTitle, for: .normal)
        return headerView
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExbanable{
            return data[section].subType.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "operationCell")
        cell?.textLabel?.text = data[indexPath.section].subType[indexPath.row]
        cell?.textLabel?.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        cell?.textLabel?.textAlignment = .right
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.section].isExbanable{
            return 40
        } else {
            return 0
        }
    }
    
}



extension OperationViewController : HeaderDelegate {
    func callHeader(index: Int) {
        
        data[index].isExbanable = !data[index].isExbanable
        tableView.reloadSections([index], with: .automatic)
        
    }
}


