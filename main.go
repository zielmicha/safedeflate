package main

import (
    "secgzip"
    "os"
    "io/ioutil"
)

func main() {
    data, _ := ioutil.ReadAll(os.Stdin)
    writer, _ := secgzip.NewWriterLevel(os.Stdout, 9)
    writer.Write(data)
    writer.Close()
}
