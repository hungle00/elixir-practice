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
  # Supervisor 

  Todo.System.start_link()
  Todo.Cache.server_process("Bob's list")
  :erlang.system_info(:process_count)  #65

  Process.exit(Process.whereis(Todo.Cache), :kill) #Terminates the entire process structure

  bobs_list = Todo.Cache.server_process("Bob's list")

  :erlang.system_info(:process_count) #65, The process count remains the same

  # Use -> Write to persist folder
  
  Todo.Server.add_entry(bobs_list, %{date: ~D[2020-12-19], title: "Coding"})
  Todo.Server.entries(bobs_list, ~D[2020-12-19])
```



