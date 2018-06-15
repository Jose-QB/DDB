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
import com.mongodb.*;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Projections.*;
import com.mongodb.client.model.Sorts;
import com.mongodb.util.JSON;
import java.util.Arrays;
import org.bson.Document;

/**
 *
 * @author erick
 */
public class MongodbConexion {

    private static MongoCollection<Document> collectionUsuarios;

    public MongodbConexion() {
        try {
            // PASO 1: Conexión al Server de MongoDB Pasandole el host y el puerto
            MongoClient mongoClient = new MongoClient("192.168.1.91", 27017);

            // PASO 2: Conexión a la base de datos
            MongoDatabase database = mongoClient.getDatabase("gtmx");
            //DB db = mongoClient.getDB("Futbol");

            // PASO 3: Obtenemos una coleccion para trabajar con ella
            MongoCollection<Document> collection = database.getCollection("usuario");
            //DBCollection collection = db.getCollection("Futbolistas");
            this.collectionUsuarios = collection;

            // PASO FINAL: Cerrar la conexion
            //mongoClient.close();
        } catch (Exception ex) {
            System.out.println("Exception al conectar al server de Mongo: " + ex.getMessage());
        }
    }

    public int getCount(String whichCollection) {
        int number = 0;
        switch (whichCollection) {
            case "usuario":
               number= (int) collectionUsuarios.count();
                break;
        }
        return number;
    }

    public void INSERT(String query) {

    }

    public void READ(String query) {

    }

    public void prueba() {
        Document myDoc = collectionUsuarios.find(eq("nombre", "Iker")).first();
        System.out.println(myDoc.toJson());
        /*MongoCursor<Document> cursor = collection.find().iterator();
        try {
            while (cursor.hasNext()) {
                System.out.println(cursor.next().toJson());
            }
        } finally {
            cursor.close();
        }*/
    }

    public void UPDATE(String dbObject, String dbObject1) {

    }

    public void REMOVE(String query) {

    }
}
