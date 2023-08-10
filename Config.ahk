; Define the path to the configuration file
configFilePath := "C:\Users\avons\Code\AutoHotkey_Scripts\config.ini"

; Check if the file exists
if !FileExist(configFilePath)
{
    MsgBox, Configuration file not found at: %configFilePath%
    ExitApp
}

; Open the file for reading
FileRead, configContent, %configFilePath%

; Split the content by newline
configLines := StrSplit(configContent, "`n")

; Iterate over each line and parse it into a global variable
for index, line in configLines
{
    ; Trim any leading/trailing whitespace
    line := Trim(line)
    
    ; Skip empty lines
    if (line = "")
        continue

    ; Extract the variable name and value
    parts := StrSplit(line, ":=")
    variableName := Trim(parts[1])
    variableValue := Trim(parts[2])

    ; Assign the value to the global variable
    Global %variableName% := variableValue
}

