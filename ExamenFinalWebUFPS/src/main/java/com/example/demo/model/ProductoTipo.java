package com.example.demo.model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * The persistent class for the director database table.
 * 
 */
@Entity
@NamedQuery(name="Director.findAll", query="SELECT d FROM Director d")
public class Director implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String codigo;

	private String cvlac;

	private String direccion;

	private String email;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_nacimiento")
	private Date fechaNacimiento;

	private String identificacion;

	private String nombre;

	private String telefono;

	//bi-directional many-to-one association to Departamento
	@ManyToOne
	private Departamento departamento;

	//bi-directional many-to-one association to NivelFormacion
	@ManyToOne
	@JoinColumn(name="nivel_formacion_id")
	private NivelFormacion nivelFormacion;

	//bi-directional many-to-one association to Semillero
	@OneToMany(mappedBy="director")
	@JsonIgnore
	private List<Semillero> semilleros;

	public Director() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getCvlac() {
		return this.cvlac;
	}

	public void setCvlac(String cvlac) {
		this.cvlac = cvlac;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFechaNacimiento() {
		return this.fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getIdentificacion() {
		return this.identificacion;
	}

	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Departamento getDepartamento() {
		return this.departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

	public NivelFormacion getNivelFormacion() {
		return this.nivelFormacion;
	}

	public void setNivelFormacion(NivelFormacion nivelFormacion) {
		this.nivelFormacion = nivelFormacion;
	}

	public List<Semillero> getSemilleros() {
		return this.semilleros;
	}

	public void setSemilleros(List<Semillero> semilleros) {
		this.semilleros = semilleros;
	}

	public Semillero addSemillero(Semillero semillero) {
		getSemilleros().add(semillero);
		semillero.setDirector(this);

		return semillero;
	}

	public Semillero removeSemillero(Semillero semillero) {
		getSemilleros().remove(semillero);
		semillero.setDirector(null);

		return semillero;
	}

}