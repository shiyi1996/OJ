package db

import (
	"testing"
	"log"
	"fmt"
)

func TestSubmitQuery(t *testing.T){
	data, err := Query()
	if err != nil{
		log.Fatal(err)
	}

	for _, submit_p := range data{
		fmt.Println(submit_p.Submit_id)
	}
}

func TestSubmitInsert(t *testing.T){
	t_data := Submit{0, 1, 1, "2001-12-03", 1000, 128000, 0, "asas", 0, "hello.c", 100}


	res, err := Insert(t_data)
	if err != nil{
		log.Fatal(err)
	}

	fmt.Println(res.RowsAffected())
}

func TestSubmitUpdate(t *testing.T){

	res, err := Update(5, 0, "dfasf")
	if err != nil{
		log.Fatal(err)
	}

	fmt.Println(res.RowsAffected())
}