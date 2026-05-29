package org.danielcatalan.model.dao;

import org.danielcatalan.model.Clientes;
import java.util.List;

public interface ClientesDAO {
    boolean insertar(Clientes cliente);
    List<Clientes> listar();
    Clientes buscar(int id);
    boolean actualizar(Clientes cliente);
    boolean eliminar(int id);
}