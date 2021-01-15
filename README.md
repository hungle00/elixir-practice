# Elixir practice

**1. Toy Robot**

*Note in supervisor*
```
You can wrap OtpRobot by Supervisor in iex:  
    iex -S mix  
    Supervisor.start_link([ToyRobot.OtpRobot], strategy: one_for_one)  
    ToyRobot.OtpRobot.report  
    ToyRobot.OtpRobot.trigger_failure  => make process crash  
    ToyRobot.OtpRobot.report   
```


