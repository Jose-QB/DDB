/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.awt.Image;

/**
 *
 * @author Alan
 */
public class Ejercicio {
    private String palabra;
    private byte[] foto;
    private int intento;
    private String rf1, rf2;
    private byte[] ff1, ff2;

    public Ejercicio(String palabra, byte[] foto) {
        this.palabra = palabra;
        this.foto = foto;
        this.intento = 0;
        this.rf1 = "";
        this.rf2 = "";
    }

    public String getPalabra() {
        return palabra;
    }

    public void setPalabra(String palabra) {
        this.palabra = palabra;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public int getIntento() {
        return intento;
    }

    public void setIntento(int intento) {
        this.intento = intento;
    }
    public void setRf1(String rf1) {
        this.rf1 = rf1;
    }

    public void setRf2(String rf2) {
        this.rf2 = rf2;
    }

    public String getRf1() {
        return rf1;
    }

    public String getRf2() {
        return rf2;
    }

    public byte[] getFf1() {
        return ff1;
    }

    public void setFf1(byte[] ff1) {
        this.ff1 = ff1;
    }

    public byte[] getFf2() {
        return ff2;
    }

    public void setFf2(byte[] ff2) {
        this.ff2 = ff2;
    }
    

}
