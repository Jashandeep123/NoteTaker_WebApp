package com.Factory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		if(factory==null) {
			factory=new Configuration().configure().buildSessionFactory();
		}
		return factory;
	}
	
	public void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
}
