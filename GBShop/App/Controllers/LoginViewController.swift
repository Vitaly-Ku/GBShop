//
//  LoginViewController.swift
//  GBShop
//
//  Created by Vit K on 19.01.2021.
//

import UIKit

class LoginViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
    }
    
    @IBAction func loginButtonWasTapped(_ sender: UIButton) {
        guard let login = loginTextField.text, let password = passwordTextField.text else {
            loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        guard !login.isEmpty else {
            loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 5, revert: true)
            return
        }

        guard !password.isEmpty else {
            passwordTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        authorize(login: login, password: password)
    }
    
    
    func configureTextFields(){
        loginTextField.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)
        passwordTextField.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)
    }

    func authorize(login : String, password : String){
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    print("авторизация!")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка авторизации!", message: error.errorDescription ?? "")
                }
            }
        }
    }
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toRegistration", sender: self)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "toProduct":
            let isAuth = checkUserData()
            if !isAuth {
                showAlert(title: "Ошибка", message: "Введены не верные данные пользователя")
            }
            return isAuth
        default:
            return true
        }
    }
    
    func checkUserData() -> Bool {
        let login = loginTextField.text
        let password = passwordTextField.text
        return password == "123456" && login == "admin"
    }
}



extension UITextField {
    func setBottomBorderOnlyWith(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.shadowOpacity = 3.0
        self.layer.shadowRadius = 3.0
    }
    
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}
