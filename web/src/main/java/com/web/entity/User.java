package com.web.entity;

/**
 * Created by TongYiMing on 2017/6/2.
 */
public class User extends BasicVo {

    private int user_id; //用户ID(主键)
    private String username; //用户名
    private String nickname = "123456"; //昵称
    private String email; //邮箱
    private String password; //密码
    private String picture = "1.jpg"; //用户头像
    private int age; //年龄
    private int sex;//性别
    private String school; //学校
    private int ac_num; //通过题目数量

    public User() {}

    public User(int user_id, String username, String nickname, String email, String password, String picture, int age, int sex, String school, int ac_num) {
        this.user_id = user_id;
        this.username = username;
        this.nickname = nickname;
        this.email = email;
        this.password = password;
        this.picture = picture;
        this.age = age;
        this.sex = sex;
        this.school = school;
        this.ac_num = ac_num;
    }

    public User(String username, String nickname, String email, String password, String picture, int age, int sex, String school, int ac_num) {
        this.username = username;
        this.nickname = nickname;
        this.email = email;
        this.password = password;
        this.picture = picture;
        this.age = age;
        this.sex = sex;
        this.school = school;
        this.ac_num = ac_num;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public int getAc_num() {
        return ac_num;
    }

    public void setAc_num(int ac_num) {
        this.ac_num = ac_num;
    }
}
