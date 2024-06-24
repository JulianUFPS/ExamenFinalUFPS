package com.example.demo.model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the evento database table.
 * 
 */
@Entity
@NamedQuery(name="Evento.findAll", query="SELECT e FROM Evento e")
public class Evento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Lob
	private String descripcion;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_realizacion")
	private Date fechaRealizacion;

	private String lugar;

	private String nombre;

	//bi-directional many-to-one association to EventoNivel
	@ManyToOne
	@JoinColumn(name="nivel_id")
	private EventoNivel eventoNivel;

	//bi-directional many-to-one association to Participacion
	@OneToMany(mappedBy="evento")
	private List<Participacion> participacions;

	public Evento() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaRealizacion() {
		return this.fechaRealizacion;
	}

	public void setFechaRealizacion(Date fechaRealizacion) {
		this.fechaRealizacion = fechaRealizacion;
	}

	public String getLugar() {
		return this.lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public EventoNivel getEventoNivel() {
		return this.eventoNivel;
	}

	public void setEventoNivel(EventoNivel eventoNivel) {
		this.eventoNivel = eventoNivel;
	}

	public List<Participacion> getParticipacions() {
		return this.participacions;
	}

	public void setParticipacions(List<Participacion> participacions) {
		this.participacions = participacions;
	}

	public Participacion addParticipacion(Participacion participacion) {
		getParticipacions().add(participacion);
		participacion.setEvento(this);

		return participacion;
	}

	public Participacion removeParticipacion(Participacion participacion) {
		getParticipacions().remove(participacion);
		participacion.setEvento(null);

		return participacion;
	}

}