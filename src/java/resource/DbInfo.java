
package resource;

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
