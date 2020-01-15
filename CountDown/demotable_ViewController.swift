//
//  demotable_ViewController.swift
//  CountDown
//
//  Created by Nguyễn Minh Hiếu on 1/13/20.
//  Copyright © 2020 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
 
var g : CGFloat = 0

class demotable_ViewController: UIViewController {
    
    var content : Array<String> = ["This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","hieu","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","hieu","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","hieu","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!","hieu"]
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tableheight: NSLayoutConstraint!
    
    
    var heightscreen = UIScreen.main.bounds.height
    var contentSizeOB : NSKeyValueObservation? // bien thong bao su thay doi cua doi tuong khac
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.bounces = false
//
        table.bounces = false
        table.isScrollEnabled  = false
        table.dataSource = self
        scroll.delegate = self
        scroll.contentSize = CGSize(width: scroll.bounds.width, height: scroll.bounds.height)
        // Trying to resize the tableView and scrollView to fit more contents
      
    }
    

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
    //    table.dataSource = self
//        self.tableheight?.constant = CGFloat(content.count)*self.table.estimatedRowHeight
//        print(tableheight.constant)
//        print(content.count)
//        print(table.rowHeight)
        contentSizeOB = self.table.observe(\UITableView.contentSize, options: [.new]) { (_, change) in
                if let newSize = change.newValue{
                           self.tableheight.constant = newSize.height
                    print(self.tableheight.constant)
                }
                      }
        
        print(tableheight.constant)

     }

}

extension demotable_ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"tablecell", for: indexPath) as? TableViewCell
            else{
                return UITableViewCell()
        }
        var coo = content[indexPath.row]
        cell.txtlabel.text = coo
        //g = cell.contentView.bounds.height
        return cell
    }

}

extension demotable_ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yoffset = scrollView.contentOffset.y
        
        if scrollView == self.scroll {
            if yoffset >= scrollView.bounds.height - heightscreen{
                scrollView.isScrollEnabled = false
                table.isScrollEnabled = true
            }
        }

        if scrollView == self.table{
            if yoffset <= 0{
                scroll.isScrollEnabled = true
                table.isScrollEnabled = false
            }
        }
        
    }
}
