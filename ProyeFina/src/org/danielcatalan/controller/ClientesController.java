package org.danielcatalan.controller;

import org.danielcatalan.model.dao.ClientesDAO;
import org.danielcatalan.model.dao.ClientesDAOImpl;
import org.danielcatalan.model.Clientes;
import org.danielcatalan.view.ClientesView;
import java.util.List;

public class ClientesController {

    private final ClientesView vista;
    private final ClientesDAO dao;

    public ClientesController(ClientesView vista) {
        this.vista = vista;
        this.dao = new ClientesDAOImpl();
    }

    public void iniciar() {
        int opcion;

        do {
            opcion = vista.mostrarMenu();

            switch (opcion) {
                case 2:
                    listar();
                    break;

                case 6:
                    System.out.println("Si hay");
                    break;

                default:
                    System.out.println("NO hay");
            }
        } while (opcion != 6);
    }

    private void listar() {
        // magia
        List<Clientes> lista = dao.listar();

        // ya no hay magia
        if (lista.isEmpty()) {
            vista.mostrarMensaje("NO HAY CLIENTES");
        } else {
            vista.mostrarTodos(lista);
        }
    }
}