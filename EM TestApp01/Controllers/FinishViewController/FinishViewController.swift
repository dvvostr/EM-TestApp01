import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

class FinishViewController: TitledBaseViewController {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var imageView: UIImageView? {
        didSet {
            self.imageView?.backgroundColor = UIColor.Preset.backgroundLight
            self.imageView?.layer.cornerRadius = 47
            self.imageView?.layer.masksToBounds = true
            self.imageView?.image = UIImage(named: "imageFunny")?.withInset(insets: 25.0)
        }
    }
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Ваш заказ принят в работу"
            self.labelCaption?.textColor = UIColor.Preset.text
            self.labelCaption?.font = Config.Fonts.Font(ofSize: 22, width: .medium)
            
        }
    }
    @IBOutlet public weak var labelDesc: UILabel? {
        didSet {
            self.labelDesc?.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
            self.labelDesc?.textColor = UIColor.Preset.textSubtitle
            self.labelDesc?.font = Config.Fonts.Font(ofSize: 16)
        }
    }
    @IBOutlet public weak var buttonExecute: CustomButton? {
       didSet {
           self.buttonExecute?.setTitle("Супер!".localized, for: UIControl.State.normal)
           self.buttonExecute?.addTarget(self, action: #selector(FinishViewController.handleButtonExecuteClick), for: UIControl.Event.touchUpInside)
       }
   }
    override func setup() {
        super.setup()
        view.backgroundColor = UIColor.Preset.backgroundLight
        navigationItem.hidesBackButton = true
        let backButton = UIButton(frame: .zero)
        backButton.setImage(UIImage.Preset.chevron_back?.withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(handleButtonExecuteClick(sender: )), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backButton)
    }
    override func navigationDidBack(_ isContinue: inout Bool) {
        isContinue = false
        handleButtonExecuteClick(sender: nil)
    }
    @objc private func handleButtonExecuteClick(sender: Any?) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
