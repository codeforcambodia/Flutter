Check the website: https://diveintoflutter.blogspot.com/2019/04/flutter-future-builder-simple.html

FutureBuilder :-
In flutter, FutureBuilder is used, if you have a delay in data or if you will get data after some interval.
In this post we will try to learn FutureBuilder with a simple example.

FutureBuilder Constructor :-

future.
builder.
initialData.
Before implementing let's understand the constructor.

1. Future :-
This parameter receives the data after some interval ( sends the result to the builder ) or with the Future<T> class where T can be any type of Future like String, int, void, etc...

2. Builder :-
This parameter receives the data from the future and returns the widget. Any action on received data can be performed here. If you are not clear yet, don't worry we see an example soon.

3. InitialData :-
This is an optional parameter, if we set initialData parameter value, the builder will show the initialData value until future returns the data.


