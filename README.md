# Elixir practice

**1. Toy Robot**

*Note in supervisor*

You can wrap OtpRobot by Supervisor in iex:  
``` 
    Supervisor.start_link([ToyRobot.OtpRobot], strategy: one_for_one)  
    ToyRobot.OtpRobot.report  
    ToyRobot.OtpRobot.trigger_failure  => make process crash  
    ToyRobot.OtpRobot.report   
```


**2. Todo**

```
    {:ok, cache} = Todo.Cache.start()  
    :erlang.system_info(:process_count)  //=> n  
    Enum.each(1..10_000, fn index ->  
      Todo.Cache.server_process(cache, "todo_list #{index}")  
    end)  
    :erlang.system_info(:process_count)  //=> n + 10000  
```



