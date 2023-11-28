# ModuleConsumerApp IOS

Integration of module to Native IOS Project


Modify pod file and add below pod dependency
<img width="544" alt="image" src="https://github.com/rakezbohara/ModuleConsumerApp/assets/10544029/b1929521-86ed-40d6-b8f7-57e05dc74ecf">


```
 pod 'SDKSample', :git => 'https://github.com/rakezbohara/sdksample.git', :branch => 'main'
```


Run pod install. After the success of pod install you should be able to see following framework file.
![Uploading image.png…]()




Initialize flutter engine as below.

```
lazy var flutterEngine = FlutterEngine(name: "fullScreenEngineId")
```


Call the flutter method channel as below.

```
var flutterMethodChannel = FlutterMethodChannel(name: "CHANNEL_DUMMY", binaryMessenger: flutterEngine.binaryMessenger)
        flutterMethodChannel.invokeMethod("METHOD_GET_DUMMY", arguments: "DEFAULT") { (result: Any?) in
            if let data = result as? String{
                //Success case
                self.textView.text = "Result Received :  \(data)"
            }else{
                //Failed case
            }
        }
```
	




Note: Along with this documentation, sample application will be provided.
	
















