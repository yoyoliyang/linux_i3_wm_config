package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strconv"
)

type workspace struct {
	Num     int  `json:"num"`
	Focused bool `json:"focused"`
}

type workspaceList []workspace

var help string = "usage: 使用left或right作为切换参数."

func main() {

	if len(os.Args) != 2 {
		fmt.Fprintf(os.Stdout, "%v\n%v\n", os.Args[0], help)
		return
	}

	arg := os.Args[1]

	data, err := get()
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		return
	}

	// 创建workspace的结构体切片数据
	ws := &[]workspace{}
	err = json.Unmarshal(data, ws)

	for _, item := range *ws {
		if item.Focused == true {
			ns := item.Num
			switch arg {
			case "left":
				ns -= 1
			case "right":
				ns += 1
			default:
				fmt.Fprintln(os.Stdout, help)
				return
			}

			r, err := change(ns)
			if err != nil {
				fmt.Fprintln(os.Stdout, err)
				return
			}
			fmt.Fprintln(os.Stdout, string(r))
		}
	}

}

func get() (b []byte, err error) {
	i3cmd := exec.Command("i3-msg", "-t", "get_workspaces")
	// json format but []byte
	cmdOut, err := i3cmd.Output()
	if err != nil {
		return b, err
	}
	return cmdOut, nil
}

func change(n int) (r []byte, err error) {
	ns := strconv.FormatInt(int64(n), 10)
	i3cmd := exec.Command("i3-msg", "workspace", ns)
	r, err = i3cmd.Output()
	if err != nil {
		return r, err
	}
	return r, nil
}
