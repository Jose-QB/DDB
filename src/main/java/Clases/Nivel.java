/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.awt.Image;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Alan
 */
public class Nivel {

    private ArrayList<Ejercicio> nivel;
    private int puntaje;

    public Nivel() {
        nivel = new ArrayList<Ejercicio>();
        puntaje = 10;
    }

    public Nivel(ArrayList<Ejercicio> ejercicio) {
        nivel = ejercicio;
        puntaje = 10;
    }

    public ArrayList<Ejercicio> getNivel() {
        return nivel;
    }

    public void insertar(String palabra, byte[] foto) {
        nivel.add(new Ejercicio(palabra, foto));
    }

    public void insertar(Ejercicio e) {
        nivel.add(e);
    }
    
    public void remover(){
        nivel.remove(0);
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
    
    public void respuestasFalsas() {
        Ejercicio aux;
        ArrayList<Ejercicio> lista = new ArrayList<Ejercicio>();
        if (nivel.size() > 2) {
            for (int i = 0, r1 = 0, r2 = 0; i < nivel.size(); i++, r1 = r2 = i) {
                while (r1 == i) {
                    r1 = (int) (Math.random() * nivel.size());
                }
                while (r2 == i || r2 == r1) {
                    r2 = (int) (Math.random() * nivel.size());
                }
                aux = nivel.get(i);
                aux.setRf1(nivel.get(r1).getPalabra());
                aux.setRf2(nivel.get(r2).getPalabra());
                aux.setFf1(nivel.get(r1).getFoto());
                aux.setFf2(nivel.get(r2).getFoto());
                lista.add(aux);
            }
        }
        nivel = lista;
    }
    public void desordenar(){
        Collections.shuffle(this.nivel);
    }
    public void imp() {
        for (int i = 0; i < nivel.size(); i++) {
            System.out.println(i + " " + nivel.get(i).getPalabra() + " " + nivel.get(i).getRf1() + " " + nivel.get(i).getRf2());
        }
    }

    public void bajarPuntaje() {
        if(this.puntaje > 0)
            this.puntaje--;
    }

    public int getPuntaje() {
        return puntaje;
    }
}
