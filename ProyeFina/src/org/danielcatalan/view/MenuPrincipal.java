package org.danielcatalan.view;

import java.util.Scanner;
import org.danielcatalan.controller.ClientesController;

public class MenuPrincipal {
    private final Scanner leer = new Scanner(System.in);

    public void iniciarSistema(){
        int opcion;

        do {
            System.out.println("....................................");
            System.out.println("  -  ..SISTEMA CENTRAL TALLER.. -   ");
            System.out.println("....................................");
            System.out.println("1. Entrar a CLIENTES");
            System.out.println("2. SALIR DEL SISTEMA");
            System.out.println("Seleccione una opcion: ");

            opcion = Integer.parseInt(leer.nextLine());

            switch (opcion) {
                case 1:
                    ClientesView vista = new ClientesView();
                    ClientesController control = new ClientesController(vista);
                    control.iniciar();
                    break;

                case 2:
                    System.out.println("HASTA LA PROXIMAAAAA");
                    break;

                default:
                    System.out.println("no existe la opcion");
            }
        } while (opcion != 2);
    }
}