package db

import (
	"log"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

type Submit struct{
	Submit_id int
	Problem_id int
	User_id int
	Submit_time string
	Running_time int
	Running_memory int
	Result int
	Result_description string
	Language int
	Code string
	Accept_sum int
}

func initMysql() *sql.DB {
	//打开数据库连接Open(DSN数据源字符串：用户名:密码@协议(地址:端口)/数据库?参数=参数值串)
	db, err := sql.Open("mysql", "root:shiyi@tcp(127.0.0.1:3306)/oj?charset=utf8")
	if err != nil {
		log.Fatal(err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	return db
}

func Query() (data []*Submit, err error) {
	db := initMysql()
	defer db.Close()

	rows, err := db.Query(`select * from submit where result=0`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		t_data := new(Submit)

		err := rows.Scan(
			&t_data.Submit_id,
			&t_data.Problem_id,
			&t_data.User_id,
			&t_data.Submit_time,
			&t_data.Running_time,
			&t_data.Running_memory,
			&t_data.Result,
			&t_data.Result_description,
			&t_data.Language,
			&t_data.Code,
			&t_data.Accept_sum)
		if err != nil{
			log.Fatal(err)
			return nil, err
		}

		data = append(data, t_data)
	}

	return data, nil
}

func Insert(t_data Submit) (res sql.Result, err error){
	db := initMysql()
	defer db.Close()

	stmt, err := db.Prepare(`insert submit (
	submit_id,
	problem_id,
	user_id,
	submit_time,
	running_time,
	running_memory,
	result,
	result_description,
	language,
	code,
	accept_sum
	) values (?,?,?,?,?,?,?,?,?,?,?)`)
	if err != nil{
		return nil, err
	}

	res, err = stmt.Exec(
		t_data.Submit_id,
		t_data.Problem_id,
		t_data.User_id,
		t_data.Submit_time,
		t_data.Running_time,
		t_data.Running_memory,
		t_data.Result,
		t_data.Result_description,
		t_data.Language,
		t_data.Code,
		t_data.Accept_sum)
	if err != nil{
		log.Fatal(err)
		return nil, err
	}

	return res, err
}


func Update(submit_id int, result int, result_desc string) (res sql.Result, err error) {
	db := initMysql()
	defer db.Close()

	stmt, err := db.Prepare("update submit set result=?,result_description=?  where submit_id=?")
	if err != nil{
		log.Fatal(err)
		return nil, err
	}

	res, err = stmt.Exec(result, result_desc, submit_id)
	if err != nil{
		log.Fatal(err)
		return nil, err
	}

	return res, err
}