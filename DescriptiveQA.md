1.What is the difference between Hot Reload and Hot Restart?

Hot reload is done when some changes done in code and we need to see the changes in output, then we use hot reload. While using the hot reload function the state in our app will not change.

Hot restart is same as Hot reload but the difference is that Hot restart will affect the state of the app. While using hot restart, the existing state of the app will be cleared and the app starts from the initial state.


2. What are the different ways we can create a custom widget?

We can create custom widget when we need to use the same custom look of the widget and it needs to be used in different places in the code. We can create the custom widget in a new dart file with the customized design and defining the parameters required for the widget in the Constructor.


3. How can I access platform(iOS or Android) specific code from Flutter?

We can access the platform specific code using the MethodChannel with the unique method channel name and writing the native function corresponding to the Method Channel we created in Dart.


4. What do you know about eventloop and what is the relationship with isolates?

Event loop is responsible for controlling the code execution by reading the queues. it works like FIFO. Isolates is an abstraction on top of threads. it is similar to event loops but it has its own memory space and it cannot share mutable values with other isolates.
