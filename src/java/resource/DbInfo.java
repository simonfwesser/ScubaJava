
package resource;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public enum DbInfo {
    
    FILEPATH("../../web/WEB-INF/web_database.db"),
    URL("jdbc:sqlite:"),
    DRIVER_CLASS("org.sqlite.JDBC"),
    DIALECT("dialect.SQLiteDialect"),
    USERNAME(""),
    PASSWORD("");
    
    private final String _info;
    
    DbInfo(String info) {
        _info = info;
    }
    
    @Override
    public String toString(){
        return _info;
    }
    
}
