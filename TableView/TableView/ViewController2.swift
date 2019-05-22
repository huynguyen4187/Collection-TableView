//
//  ViewController2.swift
//  TableView
//
//  Created by Nguyen Hoang Huy on 5/10/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource,AddingProtocol {
    
    
    
    

    @IBOutlet weak var tableview2: UITableView!

    var videos:[VideoModel]=[]
    
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview2.dataSource = self
        tableview2.delegate = self
        //Ẩn navigation màn hình chính
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.view.isUserInteractionEnabled = true
        
        tableview2.isUserInteractionEnabled = true
        let taponimage = UITapGestureRecognizer(target: self, action: <#T##Selector?#>)
        self.tableview2.addGestureRecognizer(taponimage)
      
    }
    
    //Hàm insert ở file AddingViewController
    func insertvideo(model: VideoModel) {
        videos.append(model)
        let indexPath = IndexPath(row: videos.count-1, section: 0)
        tableview2.beginUpdates()
        tableview2.insertRows(at: [indexPath], with:  .automatic)
        tableview2.endUpdates()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoadding"{
            let vc:AddingViewController = segue.destination as! AddingViewController
            vc.delegate = self
        }
    }
    //
    
    //Đọc dữ liệu và hiển thị lên tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview2.dequeueReusableCell(withIdentifier: "CELL",for : indexPath) as! tableView
        let video = videos[indexPath.row]
        cell.setVideo(video: video)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    func taponimage() {
        
    }
    //
    //Swipe để delete dữ liệu
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let delete = UIContextualAction(style: .destructive, title: "delete") { (action, view, nil) in
            
            
            let item = self.videos[indexPath.row]
            do{
                try self.realm.write {
                    self.realm.delete(item)
                }
                self.videos.remove(at: indexPath.row)
                self.tableview2.reloadData()
            }catch{
                print("error")
            }
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let update = UIContextualAction(style: .normal, title: "Edit") { (action, view, nil) in
            let vc:AddingViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddingViewController") as! AddingViewController
            vc.updateObject = self.videos[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        update.backgroundColor = UIColor.green
        return  UISwipeActionsConfiguration(actions: [update])
    }
//    @IBAction func Adding(_ sender: Any) {
//        let next:AddingViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddingViewController") as! AddingViewController
//        self.navigationController?.pushViewController(next, animated: true)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        fetch()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    //
    //Lấy dữ liệu về
    func fetch() {
        videos.removeAll()
        let AllItem = realm.objects(VideoModel.self)
        for item in AllItem{
            videos.append(item)
        }
        tableview2.reloadData()
    }
}
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
