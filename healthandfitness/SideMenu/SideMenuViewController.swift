//
//  SideMenuViewController.swift
//  healthandfitness
//
//  Created by Udeesha Induras on 2023-05-08.
//

import UIKit
import SwiftKeychainWrapper

class SideMenuViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let menuSubBackgroundView : UIView = {
        
        let view = UIView()
        view.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.65)
        return view
        
    }()
    let mainLogo : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "SplashScreen"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    let menuClose : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "close"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    
    let scheduleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "Custom Schedule"
        lbl.font = UIFont(name:"Roboto-Bold",size:18)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let clearLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "Clear Logs"
        lbl.font = UIFont(name:"Roboto-Bold",size:18)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let changeGoalLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "Change my goal"
        lbl.font = UIFont(name:"Roboto-Bold",size:18)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    
    let logoutLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "Logout"
        lbl.font = UIFont(name:"Roboto-Bold",size:18)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    let bottomLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.text = "©2023 Health and Fitness. All rights reserved"
        lbl.font = UIFont(name:"Roboto-MediumItalic",size:10)
        lbl.textAlignment = .center
        
        return lbl
    }()
    let divider : UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 0.7)
        return view
        
    }()
    let dividerSecond : UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 0.7)
        return view
        
    }()
    
    let dividerThird: UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 0.7)
        return view
        
    }()
    
    let deviderBottom : UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 0.7)
        return view
        
    }()
    
    
    let vStack : UIStackView = {
        
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing  = 20
        stackView.axis = .vertical
        return stackView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(mainLogo)
        view.addSubview(menuSubBackgroundView)
        view.addSubview(menuClose)
        menuSubBackgroundView.addSubview(scrollView)
        
        vStack.addArrangedSubview(scheduleLabel)
        vStack.addArrangedSubview(divider)
        vStack.addArrangedSubview(clearLabel)
        vStack.addArrangedSubview(dividerSecond)
        vStack.addArrangedSubview(changeGoalLabel)
        vStack.addArrangedSubview(dividerThird)
        
        
        scrollView.addSubview(vStack)
        
        menuSubBackgroundView.addSubview(logoutLabel)
        menuSubBackgroundView.addSubview(deviderBottom)
        menuSubBackgroundView.addSubview(bottomLabel)
        
        setupConstraints()
        
        
        menuClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeMenu(sender:))))
        
        scheduleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openSchedule(sender:))))
        clearLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clearLogs(sender:))))
        changeGoalLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openChangeGoal(sender:))))
        
        logoutLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logout(sender:))))
        
    }
    func setupConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset.bottom = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        menuSubBackgroundView.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide)
            const.trailing.leading.equalTo(view)
            const.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
        menuClose.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            const.height.width.equalTo(20)
            const.trailing.equalTo(view).offset(-10)
            
        }
        mainLogo.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            const.centerX.equalTo(view)
            
        }
        bottomLabel.snp.makeConstraints { const in
            
            const.bottom.equalTo(menuSubBackgroundView.snp.bottom).offset(-15)
            const.leading.trailing.equalTo(menuSubBackgroundView)
            
        }
        deviderBottom.snp.makeConstraints { const in
            
            const.height.equalTo(1)
            const.bottom.equalTo(bottomLabel.snp.top).offset(-25)
            const.width.equalTo(menuSubBackgroundView.snp.width).inset(40)
            const.centerX.equalTo(menuSubBackgroundView.snp.centerX)
        }
        logoutLabel.snp.makeConstraints { const in
            
            
            const.bottom.equalTo(deviderBottom.snp.top).offset(-25)
            const.width.equalTo(menuSubBackgroundView.snp.width).inset(40)
            const.centerX.equalTo(menuSubBackgroundView.snp.centerX)
        }
        
        scrollView.snp.makeConstraints { const in
            const.top.equalTo(menuSubBackgroundView).inset(150)
            const.center.equalTo(menuSubBackgroundView)
            const.width.equalTo(menuSubBackgroundView.snp.width).inset(40)
            
        }
        vStack.snp.makeConstraints { const in
            
            const.top.equalTo(scrollView.snp.top)
            const.centerX.equalTo(scrollView.snp.centerX)
            const.bottom.equalTo(scrollView.snp.bottom)
            const.width.equalTo(scrollView.snp.width)
            
            
        }
        divider.snp.makeConstraints { const in
            
            const.height.equalTo(1)
        }
        dividerSecond.snp.makeConstraints { const in
            
            const.height.equalTo(1)
        }
        dividerThird.snp.makeConstraints { const in
            
            const.height.equalTo(1)
        }
        
        
    }
    func presentPopup(viewControllerInstance popupViewController : PopupViewController) {
        
        
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        popupViewController.delegate = self
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController?.present(popupViewController, animated: true, completion: nil)
        }
    }
    @objc func closeMenu(sender : UIButton){
        
        self.sideMenuController?.hideRightView(animated: true)
    }
    @objc func openSchedule(sender : UIButton){
        
        self.sideMenuController?.hideRightView(animated: true)
        navigationController?.pushViewController(CustomScheduleViewController(), animated: true)
        
    }
    @objc func clearLogs(sender : UIButton){
        let popupViewController = PopupViewController()
        popupViewController.type = 2
        popupViewController.messageText = "Are you sure you want to clear all log records?"
        presentPopup(viewControllerInstance: popupViewController)
    }
    @objc func logout(sender : UIButton){
        let popupViewController = PopupViewController()
        popupViewController.type = 1
        popupViewController.messageText = "Are you sure you want to logout?"
        presentPopup(viewControllerInstance: popupViewController)
    }
    
    @objc func openChangeGoal(sender : UIButton){
      
        let goalViewController = GoalViewController()
        goalViewController.isFromOnboarding = false
        goalViewController.onGoalChangeDismiss = {
      
            if let sideMenuController = self.sideMenuController {
                if let rootViewController = sideMenuController.rootViewController {

                    (rootViewController as? HomeViewController)?.homeNetworkRequest()
                }
            }
        }
        navigationController?.pushViewController(goalViewController, animated: true)
    }
    
    
}
extension SideMenuViewController : LogoutViewControllerDelegate{
    func onChangeGoal() {
        
    }
    
    func onLogout() {
        KeychainWrapper.standard.removeAllKeys()
        navigationController?.setViewControllers([LoginViewController()], animated: true)
        
    }
    
    func onClearLogs() {
        
        KeychainWrapper.standard.set("[]", forKey: "completedExercises")
        
        KeychainWrapper.standard.set("[]", forKey: "completedCustomExercises")
        HealthAndFitnessBase.shared.showToastMessage(title: "Home", message: "All records are reseted", type: 0)
        if let sideMenuController = self.sideMenuController {
            if let rootViewController = sideMenuController.rootViewController {

                (rootViewController as? HomeViewController)?.homeNetworkRequest()
                (rootViewController as? HomeViewController)?.readStoredData()
            }
        }
    }
    
    
    
}
