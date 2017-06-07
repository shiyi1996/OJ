package main

import (
	"db"
	"fmt"
	"log"
	"os/exec"
	"strconv"
	"time"
	"syscall"
	"os"
)

var codepath = "/Users/shiyi/git/OJ/web/target/lezm/code/"
var datapath = "/Users/shiyi/git/OJ/data/"

func listener(){
	for {
		//fmt.Println("... ... ...")
		sub_list, err := db.Query()
		if err != nil {
			log.Fatal(err)
		}

		for _, sub := range sub_list {
			//fmt.Println(sub.Submit_id)
			//判题中
			db.Update(sub.Submit_id, 1, "")
			fmt.Println("judging")

			solve(sub)
		}

		time.Sleep(100000000)
	}

}

func solve(sub *db.Submit) {
	fmt.Println("compiling")
	db.Update(sub.Submit_id, 2, "")
	out, err := compile(sub)
	if err != nil{
		//编译错误
		fmt.Println("compile err", out)
		db.Update(sub.Submit_id, 4, out)
		return
	}

	fmt.Println("running")
	db.Update(sub.Submit_id, 3, "")

	usetime := run(sub)
	if usetime == -1{
		//超时
		fmt.Println("timelimit")
		db.Update(sub.Submit_id, 5, "")
		return
	}

	out = check(sub)
	if len(out) != 0{
		//错误
		fmt.Println("wrong", out)
		db.Update(sub.Submit_id, 6, out)
		return
	}

	fmt.Println("ac")
	db.Update(sub.Submit_id, 7, "")
}

func check(sub *db.Submit) string{
	pre_outfile := datapath + strconv.Itoa(sub.Problem_id) + ".out"
	now_outfile := sub.Code + ".out"

	cmd := exec.Command("diff", now_outfile, pre_outfile)
	fmt.Println(cmd.Args)
	out, _ := cmd.CombinedOutput()

	defer os.Remove(now_outfile)

	return string(out)
}

func compile(sub *db.Submit) (string, error){

	infile := codepath + sub.Code
	outfile := sub.Code + ".bin"

	var cmd *exec.Cmd
	switch sub.Language {
	case 1:
		cmd = exec.Command("g++", infile, "-o", outfile)
		break
	case 2:
		cmd = exec.Command("g++", infile, "-o", outfile)
		break
	}

	out, err := cmd.CombinedOutput()

	return string(out), err
}

func run(sub *db.Submit) int64 {
	var cmd *exec.Cmd

	infile := datapath + strconv.Itoa(sub.Problem_id) + ".in"
	outfile := sub.Code + ".out"
	runbin := sub.Code + ".bin"

	cmd = exec.Command("bash", "-c", "./" + runbin+" < " + infile+" > "+outfile)
	cmd.SysProcAttr = &syscall.SysProcAttr{Setpgid: true}

	defer os.Remove(runbin)

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
		syscall.Kill(-cmd.Process.Pid, syscall.SIGKILL)

		return -1
	}

	return 0
}

func main() {
	listener()
}
