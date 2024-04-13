repeat task.wait() until game:IsLoaded()

while task.wait(1) do 
    pcall(function()
        local connection = websocket.connect("ws://localhost:6547/")

        connection:Send("CONNECT")

        connection.OnMessage:Connect(function(message)
            if message == "2"  then
                connection:Send("3")
            else   
                loadstring(message)()
            end
        end)

        connection.OnClose:Wait()
    end)
end
