//
//  ViewController.swift
//  刷新控件
//
//  Created by 姚巍 on 16/10/4.
//  Copyright © 2016年 Guangxi City Network Technology Co.,Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var refreshControl: YWRefreshControl = YWRefreshControl()

    /*
     系统刷新控件的问题：
     1.如果用户不放手，下拉到一定程度会自动刷新
     2.如果程序主动调用 beginRefreshing 不显示菊花
     自定义刷新控件 要解决 用户放手在刷新控件
     **/
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置 contentInset
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        //添加刷新控件
        tableView.addSubview(refreshControl)
        //监听方法
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        loadData()
    }

     func loadData() {
        refreshControl.beginRefreshing()
        print("开始刷新v");
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { 
            print("结束刷新v")
            self.refreshControl.endRefreshing()
        }
    }


}

