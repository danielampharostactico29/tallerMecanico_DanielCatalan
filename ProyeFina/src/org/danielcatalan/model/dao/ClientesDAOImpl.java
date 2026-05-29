package org.danielcatalan.model.dao;

import java.util.List;
import org.danielcatalan.model.Clientes;
import java.util.ArrayList;
import org.danielcatalan.model.conexion.Conexion;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClientesDAOImpl implements ClientesDAO {

    @Override
    public boolean insertar(Clientes cliente) {
        return false;
    }

    @Override
    public List<Clientes> listar() {
        List<Clientes> clientes = new ArrayList<>();
        String consulta = "{call sp_listar_clientes()}";
        try (Connection conexion = Conexion.conectar()) {
            CallableStatement call = conexion.prepareCall(consulta);
            ResultSet resultado = call.executeQuery();
            while (resultado.next()) {
                // magia
                clientes.add(new Clientes(
                        resultado.getInt("id_cliente"),
                        resultado.getString("cedula"),
                        resultado.getString("nombre"),
                        resultado.getString("direccion")
                ));
            }
        } catch (SQLException e) {
            System.err.println("ERROR; AL LISTAR CLIENTES: " + e);
        }
        return clientes;
    }

    @Override
    public Clientes buscar(int id) {
        return null;
    }

    @Override
    public boolean actualizar(Clientes cliente) {
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        return false;
    }
}