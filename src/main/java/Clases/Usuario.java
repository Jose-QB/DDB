package Clases;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author JFrancisco
 */
public class Usuario {

    ////id_usuario,nickname,passwrd,id_pregunta,respuesta,id_avatar
    private String nickname, passwrd, respuesta;
    private int id_usuario, id_pregunta, id_avatar;

    public Usuario() {
    }

    public Usuario(int id_usuario, String nickname, String passwrd, int id_pregunta, String respuesta, int id_avatar) {
        this.nickname = nickname;
        this.passwrd = passwrd;
        this.respuesta = respuesta;
        this.id_usuario = id_usuario;
        this.id_pregunta = id_pregunta;
        this.id_avatar = id_avatar;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPasswrd() {
        return passwrd;
    }

    public void setPasswrd(String passwrd) {
        this.passwrd = passwrd;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(int id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public int getId_avatar() {
        return id_avatar;
    }

    public void setId_avatar(int id_avatar) {
        this.id_avatar = id_avatar;
    }
    
}
