package com.example.BreweryFinder.models;

public class LoginDto {
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
// TODO figure out if this is needed with a proper front-end
//    @Override
//    public String toString() {
//        return "LoginDto{" +
//                "username='" + username + '\'' +
//                ", password='" + password + '\'' +
//                '}';
//    }
}
