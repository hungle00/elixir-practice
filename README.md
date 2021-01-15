# Elixir practice

**1. Toy Robot**

*Note in supervisor*

You can wrap OtpRobot by Supervisor in iex:  
```
    iex -S mix  
    Supervisor.start_link([ToyRobot.OtpRobot], strategy: one_for_one)  
    ToyRobot.OtpRobot.report  
    ToyRobot.OtpRobot.trigger_failure  => make process crash  
    ToyRobot.OtpRobot.report   
```


**2. Todo**

```
    {:ok, todo_server} = Todo.Server.start()  
    Todo.Server.add_entry(todo_server, %{date: ~D[2020-12-19], title: "Dentist"})  
    Todo.Server.entries(todo_server, ~D[2020-12-19])  
```



