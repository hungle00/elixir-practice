# Elixir practice

### 1. Toy Robot

*Note in supervisor*

You can wrap OtpRobot by Supervisor in iex:  
``` 
    Supervisor.start_link([ToyRobot.OtpRobot], strategy: one_for_one)  
    ToyRobot.OtpRobot.report  
    ToyRobot.OtpRobot.trigger_failure  => make process crash  
    ToyRobot.OtpRobot.report   
```


### 2. Metex

```
# Metex.Worker
cities = ["Singapore", "Monaco", "Vatican City", "Hong Kong", "Macau"]
Metex.temperatures_of(cities)


# Metex.Worker2
{:ok, pid} = Metex.Worker2.start_link
Metex.Worker2.get_temperature(pid, "Hanoi")
```

### 3. Livebook Note

