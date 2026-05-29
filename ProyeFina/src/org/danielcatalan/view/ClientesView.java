package org.danielcatalan.view;

import java.util.List;
import java.util.Scanner;
import org.danielcatalan.model.Clientes;

public class ClientesView {
    private final Scanner leer = new Scanner(System.in);

    public int mostrarMenu(){
        System.out.println("GESTION DE CLIENTES");
        System.out.println("1. Registrar nuevo cliente");
        System.out.println("2. Listar todos los clientes");
        System.out.println("3. Buscar un cliente por ID");
        System.out.println("4. Actualizar un cliente");
        System.out.println("5. Eliminar un cliente");
        System.out.println("6. Regresar al menu principal");
        System.out.println("Seleccione una opcion: ");
        return Integer.parseInt(leer.nextLine());
    }

    public String solicitarNombre(){
        System.out.println("Ingrese el nombre del cliente");
        return leer.nextLine();
    }

    public int solicitarID(){
        System.out.println("Ingrese el ID del cliente: ");
        return Integer.parseInt(leer.next());
    }

    public void mostrarTodos(List<Clientes> clientes){
        System.out.println("++++LISTA DE CLIENTES++++");
        for (Clientes cli : clientes) {
            System.out.println(
                    cli.getIdClientes() + " " + cli.getCedula() + " " +
                    cli.getNombre() + " " + cli.getDireccion() + "\n");
        }
    }

    public void MostrarCliente(Clientes cliente) {
        System.out.println("DETALLE DE CLIENTE");
        System.out.println("ID: " + cliente.getIdClientes());
        System.out.println("CEDULA: " + cliente.getCedula());
        System.out.println("NOMBRE: " + cliente.getNombre());
        System.out.println("DIRECCION: " + cliente.getDireccion());
    }

    public void mostrarMensaje(String no_hay_clientes) {
        System.out.println(no_hay_clientes);
    }
}