using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Actividad
    {
        private int id_actividad;
        private int id_cliente;
        private int id_empleado;
        private int id_tipo_pedido;
        private string descripcion;
        private double precio_por_Hora;
        private int horas_trabajadas;
        private Double subtotal;
        private DateTime fecha;
        private bool estado_act;


        public Actividad()
        {

        }

        public int Id_actividad { get => id_actividad; set => id_actividad = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public int Id_empleado { get => id_empleado; set => id_empleado = value; }
        public int Id_tipo_pedido { get => id_tipo_pedido; set => id_tipo_pedido = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public double Precio_por_Hora { get => precio_por_Hora; set => precio_por_Hora = value; }
        public int Horas_trabajadas { get => horas_trabajadas; set => horas_trabajadas = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public bool Estado_act { get => estado_act; set => estado_act = value; }
    }
}
