using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Presupuesto_de_servicio
    {

        private int id_presupuesto;
        private int id_solisitud;
        private int id_cliente;
        private int id_empleado;
        private int id_tipo;
        private double precio_x_hora;
        private int horas_trabajadas;
        private double subtotal;
        private string descripcion;
        private bool estado;

        public Presupuesto_de_servicio()
        {

        }

        public int Id_presupuesto { get => id_presupuesto; set => id_presupuesto = value; }
        public int Id_solisitud { get => id_solisitud; set => id_solisitud = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public int Id_empleado { get => id_empleado; set => id_empleado = value; }
        public int Id_tipo { get => id_tipo; set => id_tipo = value; }
        public double Precio_x_hora { get => precio_x_hora; set => precio_x_hora = value; }
        public int Horas_trabajadas { get => horas_trabajadas; set => horas_trabajadas = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
