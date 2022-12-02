package com.example.SpringNew;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;





@RestController
@CrossOrigin("http://localhost:8090")
public class StudentController {
	
	
	@Autowired
	SessionFactory factory;
			
	@GetMapping("students")
	List<Student> allStudents()
	{

		Session session=factory.openSession();
		
		List<Student> arrayList= session.createCriteria(Student.class).list();
		
		return arrayList;
		
	}

	
	// @PathVariable assign value of path variable to local variable
	// localhost:8080/student/1
	
	@GetMapping("student/{rno}")
	public Student getStudent(@PathVariable int rno)
	{
		Session session=factory.openSession();
		
		Student student=session.load(Student.class,rno);
		
		return student;

	}
	
	
	@PostMapping("student")
	public List<Student>  addStudent(@RequestBody Student student)
	{
		Session session=factory.openSession();
		
		
		Transaction tx = session.beginTransaction();
		
			session.save(student);
		
		tx.commit();
		
		List<Student> list=allStudents();
		
		return list;		 
		
	}
	
	
	@DeleteMapping("student/{rno}")
	public List<Student> deleteStudent(@PathVariable int rno)
	{
		
		Session session=factory.openSession();
		
		Student student=session.load(Student.class,rno);
		
		
		Transaction tx = session.beginTransaction();
	
			session.delete(student);
			
		tx.commit();
		

		List<Student> list=allStudents();
		
		return list;		 
		
	}
	
	@PutMapping("student")
	public List<Student> updateStudent(@RequestBody Student clientStudent)
	{

		Session session=factory.openSession();
		
		
		Transaction tx = session.beginTransaction();
		
			session.saveOrUpdate(clientStudent);
					
		tx.commit();
		

		List<Student> list=allStudents();
		
		return list;		 

	}
	
}
