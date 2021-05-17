//
//  LoginFormViewController.swift
//  SocialApp
//
//  Created by Anna on 22.04.2021.
//

import UIKit
import LocalAuthentication

class LoginFormViewController: UIViewController {
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var circle1View: CircleView!
    @IBOutlet weak var circle2View: CircleView!
    @IBOutlet weak var circle3View: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        loginInput.delegate = self
        passwordInput.delegate = self
        
        authenticateUserTouchID()
    }
    
    func authenticateUserTouchID() {
        let context = LAContext()
                
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Используйте Touch ID / Face ID для входа") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        print("успешная авторизация")
                        self.animateAndLogin()
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func loginButtonPress(_ sender: Any) {
        if tryLogin() {
            animateAndLogin()
        } else {
            print("неуспешная авторизация")
        }
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        return tryLogin()
//    }
    
    func tryLogin() -> Bool {
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        
        // Вернем результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
            let password = passwordInput.text else { return false }
        
        if login == "admin" && password == "123456" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }

    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    func animateAndLogin() {
        UIView.animate(withDuration: 0.3) {
            self.loginButton.alpha = 0
        } completion: { _ in
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [.repeat, .autoreverse]) {
                self.circle1View.alpha = 1
            } completion: { _ in
                //
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: [.repeat, .autoreverse]) {
                self.circle2View.alpha = 1
            } completion: { _ in
                //
            }
            UIView.animate(withDuration: 0.3, delay: 0.2, options: [.repeat, .autoreverse]) {
                self.circle3View.alpha = 1
            } completion: { _ in
                //
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "goNext", sender: self)
        }

    }
    
    
}

extension LoginFormViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginInput {
            passwordInput.becomeFirstResponder()
        } else {
            if tryLogin() {
                animateAndLogin()
            }
        }
        
        return true
    }
    
}
