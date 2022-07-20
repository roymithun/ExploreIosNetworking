//
//  SoQuestionListViewController.swift
//  ExploreNetworking
//
//  Created by Mithun Roy on 20/07/2022.
//

import UIKit
import Alamofire

class SoQuestionListViewController: UIViewController {
    var questionsList: [SoQuestion] = []
    @IBOutlet weak var soQuestionListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soQuestionListTableView.dataSource = self
        
        fetchSoQuestions()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SoQuestionListViewController {
    func fetchSoQuestions() {
        AF.request(SoQuestionsRouter.questions(site: "stackoverflow"))
            .validate()
            .responseDecodable(of: SoQuestionList.self) { response in
                guard let soQuestionList = response.value else { return }
//                print("soQuestionList: \(soQuestionList.items.count)")
                self.questionsList.removeAll()
                self.questionsList.append(contentsOf: soQuestionList.items)
                self.soQuestionListTableView.reloadData()
            }
    }
}

extension SoQuestionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let soQuestion = questionsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! SoQuestionTableViewCell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(named: "EvenCellBGColor")
        } else {
            cell.backgroundColor = UIColor.white
        }
        cell.viewsCount.text = String(soQuestion.viewCount)
        
        let scoreColor = soQuestion.score > -1 ? UIColor(named: "PositiveScoreColor") : UIColor.red
        cell.score.textColor = scoreColor
        cell.score.text = String(soQuestion.score)
        
        // custom font
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 16.0)! ]
        let myAttrString = NSAttributedString(string: soQuestion.title.htmlToAttributedString!.string, attributes: myAttribute)
        cell.questionText.attributedText = myAttrString
        
        return cell
    }
    
    
}
