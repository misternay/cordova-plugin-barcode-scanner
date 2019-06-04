import BarcodeScanner

@objc(BarcodeScannerNew) class BarcodeScannerNew : CDVPlugin {
    var myCallbackId = ""
  @objc(scan:)
  func scan(command: CDVInvokedUrlCommand) {
    
    let viewController = makeBarcodeScannerViewController()
    viewController.title = "Hello Sawasdee"
    
    self.viewController?.present(viewController,animated: true,completion: nil)
    self.myCallbackId = command.callbackId
  }

    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        return viewController
    }
}

extension BarcodeScannerNew: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        
       let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: code
        )
        
        self.viewController.dismiss(animated: true) {
            self.commandDelegate!.send(pluginResult,callbackId: self.myCallbackId)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            controller.resetWithError()
        }
    }
}

// MARK: - BarcodeScannerErrorDelegate

extension BarcodeScannerNew: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print("Barcode Data: \(error)")
        print(error)
    }
}

// MARK: - BarcodeScannerDismissalDelegate

extension BarcodeScannerNew: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}