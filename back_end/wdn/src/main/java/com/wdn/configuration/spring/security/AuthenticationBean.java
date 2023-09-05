package com.wdn.configuration.spring.security;

public class AuthenticationBean {
    private String userName;
    private String password;
    private boolean remember;

    /**
     * Gets user name.
     *
     * @return the user name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets user name.
     *
     * @param userName the user name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets password.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets password.
     *
     * @param password the password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Is remember boolean.
     *
     * @return the boolean
     */
    public boolean isRemember() {
        return remember;
    }

    /**
     * Sets remember.
     *
     * @param remember the remember
     */
    public void setRemember(boolean remember) {
        this.remember = remember;
    }

}
