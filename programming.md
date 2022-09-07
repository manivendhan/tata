1. We can replace the "Row" widget with the "Wrap". so that when the row reaches it width it will automatically wrap to the next line. code and output => ScreenShot No: 1

2. For the given URL, I have used the dio Http Client to call the API and processed the response. Code is attached in folder named "API CALL"


3. The following code will block the app functionality till it gets executed. This type of process is known as isolate. The solution is below

Future<String> printingIValue() async {
  return await compute(LongOperationMethod, 10000000000);
}

String LongOperationMethod(int maxVal) {
  var counting = 0;
  for (var i = 1; i <= maxVal; i++) {
    counting = i;
  }
  return '$counting! times I print the value!';
}
