var exec = cordova.require("cordova/exec");

/**
 * Constructor.
 *
 * @returns {BarcodeScannerNew}
 */

function BarcodeScannerNew() {}

/**
 *
 * @param {Function} successCallback
 * @param {Function} errorCallback
 * @param config
 */

BarcodeScannerNew.prototype.scan = function (successCallback, errorCallback, config) {
    config = [];

    if (errorCallback == null) {
        errorCallback = function () {};
    }

    if (typeof errorCallback != "function") {
        console.log("BarcodeScannerNew.scan failure: failure parameter not a function");
        return;
    }

    if (typeof successCallback != "function") {
        console.log("BarcodeScannerNew.scan failure: success callback parameter must be a function");
        return;
    }

    exec(function (result) {
        successCallback(result);
    }, function (error) {
        errorCallback(error);
    }, 'BarcodeScannerNew', 'scan', config);
};

var barcodeScannerNew = new BarcodeScannerNew();
module.exports = barcodeScannerNew;