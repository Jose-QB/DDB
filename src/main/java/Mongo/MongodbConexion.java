/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mongo;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

/**
 *
 * @author erick
 */
public class MongodbConexion {

    private static DBCollection collection;

    public MongodbConexion() {
        try {
            // PASO 1: Conexión al Server de MongoDB Pasandole el host y el puerto
            MongoClient mongoClient = new MongoClient("192.168.1.80", 27017);

            // PASO 2: Conexión a la base de datos
            DB db = mongoClient.getDB("Futbol");

            // PASO 3: Obtenemos una coleccion para trabajar con ella
            DBCollection collection = db.getCollection("Futbolistas");
            this.collection = collection;

            // PASO FINAL: Cerrar la conexion
            //mongoClient.close();

        } catch (Exception ex) {
            System.out.println("Exception al conectar al server de Mongo: " + ex.getMessage());
        }
    }

    public int getCount() {
        return (int) collection.getCount();
    }
    
    public void INSERT(String query){
        DBObject dbObject = (DBObject) JSON.parse(query);
        collection.insert(dbObject);
    }
    
    public void READ(String query) {
        // Busco todos los documentos de la colección y los imprimo
        DBCursor cursor = null;
        DBObject dbObject = (DBObject) JSON.parse(query);
        try {
            cursor = collection.find(dbObject);
            while (cursor.hasNext()) {
                System.out.println(cursor.next().toString());
            }
        } finally {
            cursor.close();
        }
    }

    public void UPDATE(String dbObject, String dbObject1) {
        DBObject find = (DBObject) JSON.parse(dbObject);
        DBObject updated = (DBObject) JSON.parse(dbObject1);
        collection.update(find, updated, false, true);
    }
    
    public void REMOVE(String query){
        DBObject delete = (DBObject) JSON.parse(query);
        collection.remove(delete);
    }
}
