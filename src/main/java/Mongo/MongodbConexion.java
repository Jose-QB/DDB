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
import java.util.regex.Pattern;
import org.bson.Document;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author erick
 */
public class MongodbConexion {

    private static MongoCollection<Document> collectionUsuarios;
    private static MongoCollection<Document> collectionDicc;

    public MongodbConexion() {
        try {
            // PASO 1: Conexión al Server de MongoDB Pasandole el host y el puerto
            MongoClient mongoClient = new MongoClient("192.168.1.91", 27017);

            // PASO 2: Conexión a la base de datos
            MongoDatabase database = mongoClient.getDatabase("gtmx");
            //DB db = mongoClient.getDB("Futbol");

            // PASO 3: Obtenemos una coleccion para trabajar con ella
            MongoCollection<Document> collection = database.getCollection("usuario");
            this.collectionUsuarios = collection;
            collection = database.getCollection("dicc");
            this.collectionDicc = collection;
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
                number = (int) collectionUsuarios.count();
                break;
        }
        return number;
    }

    public JSONObject buscaUsuario(String nombre, String pass) {
        JSONObject jsonResult = null;
        try {
            Document myDoc = collectionUsuarios.find(and(eq("nickname", nombre), eq("passwrd", pass))).first();
            jsonResult = new JSONObject(myDoc.toJson().toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonResult;
    }

    public void altaUsuario(String nickname, String passwrd, int id_pregunta, String respuesta, int id_avatar) {
        Document doc = new Document("nickname", nickname)
                .append("passwrd", passwrd)
                .append("id_pregunta", id_pregunta)
                .append("respuesta", respuesta)
                .append("id_avatar", id_avatar)
                .append("nivel", Arrays.asList(0))
                .append("puntaje", 0);
        collectionUsuarios.insertOne(doc);
    }

    public JSONObject compruebaUsuario(String nombre) {
        JSONObject jsonResult = null;
        try {
            Document myDoc = collectionUsuarios.find(eq("nickname", nombre)).first();
            jsonResult = new JSONObject(myDoc.toJson().toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonResult;
    }

    public ArrayList<JSONObject> findSimilar(String param, String value) {
        ArrayList<JSONObject> jsonResult = new ArrayList<JSONObject>();
        MongoCursor<Document> myDoc=null;
        try {
            switch(param){
                case "nickname":
                    Document doc = new Document(param, Pattern.compile(value, Pattern.CASE_INSENSITIVE));
                    myDoc = collectionUsuarios.find(doc).iterator();
                    break;
                case "id_pregunta": case"id_avatar":
                    myDoc = collectionUsuarios.find(eq(param,Integer.parseInt(value))).iterator();
                    break;                    
                default:
                    myDoc = collectionUsuarios.find().iterator();
                    break;                   
            }
            
            while (myDoc.hasNext()) {
                jsonResult.add(new JSONObject(myDoc.next().toJson().toString()));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonResult;
    }
    
    public void removeUser(String nick) {
        collectionUsuarios.deleteOne(eq("nickname", nick));
    }
    
    public JSONObject buscaPalabra(String palabra) {
        JSONObject jsonResult = null;
        try {
            Document myDoc = collectionDicc.find(eq("palabra", palabra)).first();
            jsonResult = new JSONObject(myDoc.toJson().toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonResult;
    }

    public void cambioConfig(String oldNickname, String newNickname, String passwrd, int id_avatar) {
        //String modifica = "update usuario set nickname='" + nickname + "' , passwrd= '" + passwrd + "' , id_avatar=" + id_avatar + " where id_usuario=" + id_usuario + ";";
        collectionUsuarios.updateOne(eq("nickname", oldNickname), new Document("$set", new Document("passwrd", passwrd)));
        collectionUsuarios.updateOne(eq("nickname", oldNickname), new Document("$set", new Document("id_avatar", id_avatar)));
        collectionUsuarios.updateOne(eq("nickname", oldNickname), new Document("$set", new Document("nickname", newNickname)));
    }

    public void cambioPass(String nickname, String passwrd) {
        collectionUsuarios.updateOne(eq("nickname", nickname), new Document("$set", new Document("passwrd", passwrd)));
    }
}
