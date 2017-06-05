package main

import (
)
import (
	"db"
	"fmt"
	"log"
	"os/exec"
	"strconv"
	"time"
	"syscall"
)

func listener(){
	sub_list, err := db.Query()
	if err != nil{
		log.Fatal(err)
	}

	for _, sub := range sub_list{
		fmt.Println(sub.Submit_id)
		//判题中
		db.Update(sub.Submit_id, 1, "")
		solve(sub)
	}

}

func solve(sub *db.Submit) {
	out, err := compile(sub)
	if err != nil{
		//编译错误
		db.Update(sub.Submit_id, 2, out)
		fmt.Println(out)
		return
	}

	usetime := run(sub)
	if usetime == -1{
		//超时
		db.Update(sub.Submit_id, 3, "")
		return
	}

	mess := check(sub)
	if len(mess) != 0{
		//错误
		db.Update(sub.Submit_id, 4, string(mess))
	}

	db.Update(sub.Submit_id, 5, "")
}

func check(sub *db.Submit) []byte{
	pre_outfile := "/Users/shiyi/" + strconv.Itoa(sub.Submit_id) + ".out"
	now_outfile := strconv.Itoa(sub.Submit_id) + ".out"

	cmd := exec.Command("diff", now_outfile, pre_outfile)
	fmt.Println(cmd.Args)
	out, err := cmd.CombinedOutput()
	if err != nil{
		log.Fatal(err)
	}

	return out
}

func compile(sub *db.Submit) (string, error){
	var cmd *exec.Cmd
	//switch sub.Language {
	//case 0:
	infile := "/Users/shiyi/" + sub.Code
	outfile := sub.Code + ".out"

	cmd = exec.Command("gcc", infile, "-o", outfile)

	out, err := cmd.CombinedOutput()

	return string(out), err
}

func run(sub *db.Submit) int64 {
	var cmd *exec.Cmd

	infile := "/Users/shiyi/" + strconv.Itoa(sub.Submit_id) + ".in"
	outfile := strconv.Itoa(sub.Submit_id) + ".out"
	runbin := "./" + sub.Code + ".out"

	cmd = exec.Command("bash", "-c", runbin+" < " + infile+" > "+outfile)
	cmd.SysProcAttr = &syscall.SysProcAttr{Setpgid: true}

	fmt.Println(cmd.Args)

	ch := make (chan bool, 1)

	time_start := time.Now()

	go func(){
		cmd.Run()
		ch <- true
	}()

	select {
	case <- ch:
		usetime := time.Since(time_start).Nanoseconds()
		//fmt.Println("end:", usetime, time.Since(time_start))
		return usetime
	case <- time.After(1e9):
		fmt.Println("timeout!")
		fmt.Println(cmd.Process.Pid)
		syscall.Kill(-cmd.Process.Pid, syscall.SIGKILL)

		return -1
	}

	return 0
}

func main() {
	listener()
}
