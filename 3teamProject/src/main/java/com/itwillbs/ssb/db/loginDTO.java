package com.itwillbs.ssb.db;

public class LoginDTO {
    private String username;
    private String password;
    // 필요한 다른 속성 추가

    // Getter 및 Setter 메서드

    @Override
    public String toString() {
        // 객체 정보를 문자열로 반환
        return "LoginDTO [username=" + username + ", password=" + password + "]";
    }
}
