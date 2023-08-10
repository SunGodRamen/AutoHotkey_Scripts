HashString(inputString) {
    Static Prime := 31
    hashValue := 0

    Loop, Parse, title
    {
        charValue := Asc(A_LoopField)
        hashValue := (hashValue * Prime + charValue) & 0xFFFFFFFF ; Limit to 32 bits
    }
    
    return hashValue
}