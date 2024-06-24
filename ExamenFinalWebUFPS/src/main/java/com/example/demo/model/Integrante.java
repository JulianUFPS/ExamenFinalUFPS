package com.example.demo.model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the integrante database table.
 * 
 */
@Entity
@NamedQuery(name="Integrante.findAll", query="SELECT i FROM Integrante i")
public class Integrante implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private byte estado;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_ingreso")
	private Date fechaIngreso;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_retiro")
	private Date fechaRetiro;

	//bi-directional many-to-one association to Actividad
	@OneToMany(mappedBy="integrante")
	private List<Actividad> actividads;

	//bi-directional many-to-one association to Asistencia
	@OneToMany(mappedBy="integrante")
	private List<Asistencia> asistencias;

	//bi-directional many-to-one association to Capacitacion
	@OneToMany(mappedBy="integrante")
	private List<Capacitacion> capacitacions;

	//bi-directional many-to-many association to Periodo
	@ManyToMany(mappedBy="integrantes")
	private List<Periodo> periodos;

	//bi-directional many-to-one association to Estudiante
	@ManyToOne
	private Estudiante estudiante;

	//bi-directional many-to-one association to Rol
	@ManyToOne
	private Rol rol;

	//bi-directional many-to-one association to Semillero
	@ManyToOne
	private Semillero semillero;

	//bi-directional many-to-one association to Participacion
	@OneToMany(mappedBy="integrante")
	private List<Participacion> participacions;

	//bi-directional many-to-one association to Proyecto
	@OneToMany(mappedBy="integrante")
	private List<Proyecto> proyectos;

	public Integrante() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getEstado() {
		return this.estado;
	}

	public void setEstado(byte estado) {
		this.estado = estado;
	}

	public Date getFechaIngreso() {
		return this.fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public Date getFechaRetiro() {
		return this.fechaRetiro;
	}

	public void setFechaRetiro(Date fechaRetiro) {
		this.fechaRetiro = fechaRetiro;
	}

	public List<Actividad> getActividads() {
		return this.actividads;
	}

	public void setActividads(List<Actividad> actividads) {
		this.actividads = actividads;
	}

	public Actividad addActividad(Actividad actividad) {
		getActividads().add(actividad);
		actividad.setIntegrante(this);

		return actividad;
	}

	public Actividad removeActividad(Actividad actividad) {
		getActividads().remove(actividad);
		actividad.setIntegrante(null);

		return actividad;
	}

	public List<Asistencia> getAsistencias() {
		return this.asistencias;
	}

	public void setAsistencias(List<Asistencia> asistencias) {
		this.asistencias = asistencias;
	}

	public Asistencia addAsistencia(Asistencia asistencia) {
		getAsistencias().add(asistencia);
		asistencia.setIntegrante(this);

		return asistencia;
	}

	public Asistencia removeAsistencia(Asistencia asistencia) {
		getAsistencias().remove(asistencia);
		asistencia.setIntegrante(null);

		return asistencia;
	}

	public List<Capacitacion> getCapacitacions() {
		return this.capacitacions;
	}

	public void setCapacitacions(List<Capacitacion> capacitacions) {
		this.capacitacions = capacitacions;
	}

	public Capacitacion addCapacitacion(Capacitacion capacitacion) {
		getCapacitacions().add(capacitacion);
		capacitacion.setIntegrante(this);

		return capacitacion;
	}

	public Capacitacion removeCapacitacion(Capacitacion capacitacion) {
		getCapacitacions().remove(capacitacion);
		capacitacion.setIntegrante(null);

		return capacitacion;
	}

	public List<Periodo> getPeriodos() {
		return this.periodos;
	}

	public void setPeriodos(List<Periodo> periodos) {
		this.periodos = periodos;
	}

	public Estudiante getEstudiante() {
		return this.estudiante;
	}

	public void setEstudiante(Estudiante estudiante) {
		this.estudiante = estudiante;
	}

	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public Semillero getSemillero() {
		return this.semillero;
	}

	public void setSemillero(Semillero semillero) {
		this.semillero = semillero;
	}

	public List<Participacion> getParticipacions() {
		return this.participacions;
	}

	public void setParticipacions(List<Participacion> participacions) {
		this.participacions = participacions;
	}

	public Participacion addParticipacion(Participacion participacion) {
		getParticipacions().add(participacion);
		participacion.setIntegrante(this);

		return participacion;
	}

	public Participacion removeParticipacion(Participacion participacion) {
		getParticipacions().remove(participacion);
		participacion.setIntegrante(null);

		return participacion;
	}

	public List<Proyecto> getProyectos() {
		return this.proyectos;
	}

	public void setProyectos(List<Proyecto> proyectos) {
		this.proyectos = proyectos;
	}

	public Proyecto addProyecto(Proyecto proyecto) {
		getProyectos().add(proyecto);
		proyecto.setIntegrante(this);

		return proyecto;
	}

	public Proyecto removeProyecto(Proyecto proyecto) {
		getProyectos().remove(proyecto);
		proyecto.setIntegrante(null);

		return proyecto;
	}

}