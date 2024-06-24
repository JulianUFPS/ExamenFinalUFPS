package com.example.demo.model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the proyecto database table.
 * 
 */
@Entity
@NamedQuery(name="Proyecto.findAll", query="SELECT p FROM Proyecto p")
public class Proyecto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_fin")
	private Date fechaFin;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_inicio")
	private Date fechaInicio;

	private String nombre;

	@Lob
	@Column(name="objetivo_general")
	private String objetivoGeneral;

	//bi-directional many-to-one association to Actividad
	@OneToMany(mappedBy="proyecto")
	private List<Actividad> actividads;

	//bi-directional many-to-one association to Participacion
	@OneToMany(mappedBy="proyecto")
	private List<Participacion> participacions;

	//bi-directional many-to-one association to Integrante
	@ManyToOne
	@JoinColumn(name="responsable_id")
	private Integrante integrante;

	//bi-directional many-to-one association to Linea
	@ManyToOne
	private Linea linea;

	public Proyecto() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getFechaFin() {
		return this.fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public Date getFechaInicio() {
		return this.fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getObjetivoGeneral() {
		return this.objetivoGeneral;
	}

	public void setObjetivoGeneral(String objetivoGeneral) {
		this.objetivoGeneral = objetivoGeneral;
	}

	public List<Actividad> getActividads() {
		return this.actividads;
	}

	public void setActividads(List<Actividad> actividads) {
		this.actividads = actividads;
	}

	public Actividad addActividad(Actividad actividad) {
		getActividads().add(actividad);
		actividad.setProyecto(this);

		return actividad;
	}

	public Actividad removeActividad(Actividad actividad) {
		getActividads().remove(actividad);
		actividad.setProyecto(null);

		return actividad;
	}

	public List<Participacion> getParticipacions() {
		return this.participacions;
	}

	public void setParticipacions(List<Participacion> participacions) {
		this.participacions = participacions;
	}

	public Participacion addParticipacion(Participacion participacion) {
		getParticipacions().add(participacion);
		participacion.setProyecto(this);

		return participacion;
	}

	public Participacion removeParticipacion(Participacion participacion) {
		getParticipacions().remove(participacion);
		participacion.setProyecto(null);

		return participacion;
	}

	public Integrante getIntegrante() {
		return this.integrante;
	}

	public void setIntegrante(Integrante integrante) {
		this.integrante = integrante;
	}

	public Linea getLinea() {
		return this.linea;
	}

	public void setLinea(Linea linea) {
		this.linea = linea;
	}

}