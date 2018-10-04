package dataAccess;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public interface IDAO{

    void openSession();

    void closeSession();

    void beginTransaction();

    void commitTransaction();

}
