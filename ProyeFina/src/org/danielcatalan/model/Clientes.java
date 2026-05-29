package org.danielcatalan.model;

public class Clientes {

    
    private int idClientes;
    private String cedula;
    private String nombre;
    private String direccion;

    public Clientes() {
    }

    public Clientes(int idCliente, String cedula, String nombre, String direccion) {
        this.idClientes = idCliente;
        this.cedula = cedula;
        this.nombre = nombre;
        this.direccion = direccion;
    }

    public int getIdClientes() {
        return idClientes;
    }

    public void setIdCliente(int idClientes) {
        this.idClientes = idClientes;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
}