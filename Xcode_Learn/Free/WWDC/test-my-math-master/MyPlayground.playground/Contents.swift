//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var title = UILabel()

class MyViewController : UIViewController {
    var mainStackView = UIStackView()
    
    var stackViewBtn = UIStackView()
    var stackViewBtn2 = UIStackView()
    var stackViewBtn3 = UIStackView()
    let stackViewAllBtn = UIStackView()
    
    let button1 = createButton(message: "1")
    let button2 = createButton(message: "2")
    let button3 = createButton(message: "3")
    let button4 = createButton(message: "4")
    let button5 = createButton(message: "5")
    let button6 = createButton(message: "6")
    let button7 = createButton(message: "7")
    let button8 = createButton(message: "8")
    let button9 = createButton(message: "9")
    let button0 = createButton(message: "0")
    let buttonDot = createButton(message: ".")
    let buttonClear = createButton(message: "clear")
    
    let header = funcHeader()
    let question = funcQuestion()
    let answer = funcAnswer()
    
    override func loadView() {
        
        
        //let mathQuestion = UILabel()
        
        setStackView(stackView: &mainStackView)
        
        setViewButton(uIStackView: &stackViewBtn)
        stackViewBtn.addArrangedSubview(button1)
        stackViewBtn.addArrangedSubview(button2)
        stackViewBtn.addArrangedSubview(button3)
        stackViewBtn.addArrangedSubview(button4)
        
        setViewButton(uIStackView: &stackViewBtn2)
        stackViewBtn2.addArrangedSubview(button5)
        stackViewBtn2.addArrangedSubview(button6)
        stackViewBtn2.addArrangedSubview(button7)
        stackViewBtn2.addArrangedSubview(button8)
        
        setViewButton(uIStackView: &stackViewBtn3)
        stackViewBtn3.addArrangedSubview(button9)
        stackViewBtn3.addArrangedSubview(button0)
        stackViewBtn3.addArrangedSubview(buttonDot)
        stackViewBtn3.addArrangedSubview(buttonClear)
        
        stackViewAllBtn.backgroundColor = .red
        stackViewAllBtn.axis = .vertical
        stackViewAllBtn.alignment = .fill
        stackViewAllBtn.distribution = .fillEqually
        stackViewAllBtn.spacing = 1
        stackViewAllBtn.translatesAutoresizingMaskIntoConstraints = false
        stackViewAllBtn.addArrangedSubview(stackViewBtn)
        stackViewAllBtn.addArrangedSubview(stackViewBtn2)
        stackViewAllBtn.addArrangedSubview(stackViewBtn3)
        
        mainStackView.addArrangedSubview(header)
        
        mainStackView.addArrangedSubview(question)
        mainStackView.addArrangedSubview(answer)
        mainStackView.addArrangedSubview(stackViewAllBtn)
        
        
        
        
        
        self.view = mainStackView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setStackViewConstraints(stackView : &mainStackView)
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        print(sender.titleLabel?.text ?? "")
        let text = sender.titleLabel?.text ?? ""
        if (text == "clear"){
            if let label = answer.viewWithTag(1) as? UILabel {
                label.text = ""
            }
        }else {
            if let label = answer.viewWithTag(1) as? UILabel {
                let newText = (label.text ?? "").isEmpty ? "" : label.text!
                label.text = newText + text
                label.sizeToFit()
            }
        }
    }
}


func setViewButton(uIStackView: inout UIStackView){
    uIStackView.axis = .horizontal
    uIStackView.alignment = .fill
    uIStackView.distribution = .fillEqually
    uIStackView.spacing = 10
    //uIStackView.translatesAutoresizingMaskIntoConstraints = false
}

func createButton(message: String) -> UIButton{
    let button = UIButton();
    button.setTitle(message, for: .normal)
    button.backgroundColor = .systemPink
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.black.cgColor

    button.addTarget(viewController, action: #selector((viewController.buttonPressed)), for: .touchUpInside)
    return button;
}

func setStackView(stackView: inout UIStackView) {
    stackView.axis = .vertical
    stackView.alignment = .fill
    //stackView.distribution = .fillProportionally
    stackView.distribution = .fillEqually
}

func setStackViewConstraints(stackView: inout UIStackView) {
    stackView.translatesAutoresizingMaskIntoConstraints
    stackView.topAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: 20).isActive
    stackView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 50).isActive
    stackView.trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive
    stackView.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive
}

func funcHeader() -> UIView{
    let view = UIView()
    
    view.backgroundColor = .blue
    view.sizeToFit()
    
    title.text = "Test my math skill"
    title.textColor = .black
    title.font = title.font.withSize(42)
    title.backgroundColor = .red
    title.sizeToFit()
    
    //view.height = 1
    view.addSubview(title)
    
    return view
}
func funcQuestion() -> UIView {
    let view = UIView()
    view.backgroundColor = .cyan
    let title = UILabel()
    title.text = "90 x 43"
    title.textColor = .black
    title.font = title.font.withSize(64)
    title.backgroundColor = .red
    title.sizeToFit()
    
    view.addSubview(title)
    return view
}

func funcAnswer() -> UIView {
    let view = UIView()
    view.backgroundColor = .green
    
    let answer = UILabel()
    answer.textColor = .black
    answer.backgroundColor = .red
    answer.font = answer.font.withSize(64)
    answer.sizeToFit()
    
    answer.tag = 1
    
    view.addSubview(answer)
    return view
}


// Present the view controller in the Live View window
let viewController = MyViewController()

PlaygroundPage.current.liveView = viewController

