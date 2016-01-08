import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var myTipLabel: UILabel!
    @IBOutlet weak var mySplitTipLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var twentyFiveButton: UIButton!
    @IBOutlet weak var mySplitTotalLabel: UILabel!
    @IBOutlet weak var myTotalLabel: UILabel!
    
    var people = 1

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func tenButtonPress(sender: UIButton)
    {
        calculateTip(0.10, numberOfPeople: people)
        setButtonImages()
        tenButton.setImage(UIImage(named: "10_selected_image"), forState: UIControlState.Normal)
    }

    @IBAction func fifteenButtonPress(sender: UIButton)
    {
        calculateTip(0.15, numberOfPeople: people)
        setButtonImages()
        fifteenButton.setImage(UIImage(named: "15_selected_image"), forState: UIControlState.Normal)
    }

    @IBAction func twentyButtonPress(sender: UIButton)
    {
        calculateTip(0.20, numberOfPeople: people)
        setButtonImages()
        twentyButton.setImage(UIImage(named: "20_selected_image"), forState: UIControlState.Normal)
    }

    @IBAction func twentyFiveButtonPress(sender: UIButton)
    {
        calculateTip(0.25, numberOfPeople: people)
        setButtonImages()
        twentyFiveButton.setImage(UIImage(named: "25_selected_image"), forState: UIControlState.Normal)
    }

    @IBAction func upButtonTap(sender: UIButton)
    {
        ++people
        numberOfPeopleLabel.text = "\(people)"
    }

    @IBAction func downButtonTap(sender: UIButton)
    {         if people == 1
        {
            people = 1
            numberOfPeopleLabel.text = "\(people)"
        }
        else
        { 
            --people
            numberOfPeopleLabel.text = "\(people)"
        }
    }
    func calculateTip(tipPercent: Double, numberOfPeople: Int) -> (String, String, String, String)
    {
        let totalDouble = Double(billTotalTextField.text!)
        let tipAmount = totalDouble! * tipPercent
        let splitTipAmount = tipAmount / Double(people)
        let totalBill = tipAmount + totalDouble!
        let splitTotalAmount = totalBill / Double(people)

        myTipLabel.text = String(format: "$ %.2f", tipAmount)
        mySplitTipLabel.text = String(format: "$ %.2f", splitTipAmount)
        mySplitTotalLabel.text = String(format: "$ %.2f", splitTotalAmount)
        myTotalLabel.text = String(format: "$ %.2f", totalBill)

        return (myTipLabel.text!, mySplitTipLabel.text!, mySplitTotalLabel.text!, myTotalLabel.text!)
    }

    func setButtonImages()
    {
        tenButton.setImage(UIImage(named: "10_unselected_image"), forState: UIControlState.Normal)
        fifteenButton.setImage(UIImage(named: "15_unselected_image"), forState: UIControlState.Normal)
        twentyButton.setImage(UIImage(named: "20_unselected_image"), forState: UIControlState.Normal)
        twentyFiveButton.setImage(UIImage(named: "25_unselected_image"), forState: UIControlState.Normal)
    }
}

